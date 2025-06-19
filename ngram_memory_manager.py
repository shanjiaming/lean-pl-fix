#!/usr/bin/env python3
"""
N-gram Memory Manager

Handles memory management, server restart mechanisms, and checkpoint functionality
for the n-gram tactic search system.

Key Features:
- Monitor Lean server memory usage and trigger restarts
- Mark dirty nodes after server restart
- Save and restore search state
- Automatic cleanup of cache entries
"""

import json
import os
import psutil
import time
from datetime import datetime, timedelta
from typing import Dict, List, Optional, Set, Any
from dataclasses import dataclass, asdict

from ngram_tactic_searcher import (
    NgramTacticSearcher, HoleSearchTree, TacticNode, 
    TacticNodeStatus, TerminalTacticType, ProofStepCacheEntry
)


@dataclass
class MemoryStats:
    """Memory usage statistics"""
    timestamp: datetime
    total_nodes: int
    cache_size: int
    memory_mb: float  # Now stores system memory percentage (kept name for compatibility)
    lean_server_active: bool
    
    def to_dict(self) -> dict:
        """Convert to dictionary for JSON serialization"""
        return {
            'timestamp': self.timestamp.isoformat(),
            'total_nodes': self.total_nodes,
            'cache_size': self.cache_size,
            'memory_mb': self.memory_mb,  # Actually system memory percentage
            'lean_server_active': self.lean_server_active
        }


class MemoryManager:
    """Manage Lean server memory and restart when necessary"""
    
    def __init__(self, 
                 max_nodes_before_restart: int = 1000,
                 max_memory_percent: float = 50.0,
                 max_runtime_hours: float = 2.0):
        self.max_nodes_before_restart = max_nodes_before_restart
        self.max_memory_percent = max_memory_percent
        self.max_runtime_hours = max_runtime_hours
        
        self.nodes_executed_since_restart = 0
        self.start_time = datetime.now()
        self.last_restart_time = self.start_time
        self.memory_history: List[MemoryStats] = []
        
        # Restart triggers
        self.restart_reasons = {
            'nodes_limit': False,
            'memory_limit': False,
            'time_limit': False,
            'manual': False
        }
    
    def get_system_memory_percent(self) -> float:
        """Get system memory usage percentage"""
        try:
            return psutil.virtual_memory().percent
        except:
            return 0.0
    
    def record_memory_stats(self, searcher: NgramTacticSearcher) -> MemoryStats:
        """Record current memory statistics"""
        stats = MemoryStats(
            timestamp=datetime.now(),
            total_nodes=sum(len(tree.nodes) for tree in searcher.hole_trees.values()),
            cache_size=len(searcher.proof_state_cache),
            memory_mb=self.get_system_memory_percent(),
            lean_server_active=searcher.lean_integrator is not None
        )
        
        self.memory_history.append(stats)
        
        # Keep only last 100 entries
        if len(self.memory_history) > 100:
            self.memory_history = self.memory_history[-100:]
        
        return stats
    
    def should_restart_server(self, searcher: NgramTacticSearcher) -> tuple[bool, str]:
        """
        Determine if server should be restarted and why
        
        Returns:
            Tuple of (should_restart, reason)
        """
        # Reset restart reasons
        self.restart_reasons = {k: False for k in self.restart_reasons}
        
        # Check node limit
        if self.nodes_executed_since_restart >= self.max_nodes_before_restart:
            self.restart_reasons['nodes_limit'] = True
            return True, f"Node limit reached ({self.nodes_executed_since_restart}/{self.max_nodes_before_restart})"
        
        # Check memory limit
        current_memory_percent = self.get_system_memory_percent()
        if current_memory_percent > self.max_memory_percent:
            self.restart_reasons['memory_limit'] = True
            return True, f"System memory usage exceeded ({current_memory_percent:.1f}%/{self.max_memory_percent}%)"
        
        # Check time limit
        runtime = datetime.now() - self.last_restart_time
        if runtime.total_seconds() / 3600 > self.max_runtime_hours:
            self.restart_reasons['time_limit'] = True
            return True, f"Runtime limit exceeded ({runtime.total_seconds()/3600:.1f}h/{self.max_runtime_hours}h)"
        
        return False, "No restart needed"
    
    def restart_server(self, searcher: NgramTacticSearcher, reason: str = "Manual") -> None:
        """Restart Lean server and mark affected nodes as dirty"""
        print(f"\n🔄 Restarting Lean server: {reason}")
        print(f"   Nodes executed since last restart: {self.nodes_executed_since_restart}")
        print(f"   Memory usage: {self.get_current_memory_usage():.1f}MB")
        print(f"   Cache size: {len(searcher.proof_state_cache)}")
        
        # Record pre-restart stats
        pre_restart_stats = self.record_memory_stats(searcher)
        
        # Shutdown current server
        if searcher.lean_integrator:
            searcher.lean_integrator.shutdown_lean_server()
        
        # Reinitialize
        from proofstep_lean_integration import MinimalLeanProofStepIntegrator
        searcher.lean_integrator = MinimalLeanProofStepIntegrator()
        searcher.lean_integrator.initialize_lean_server()
        
        # Clear cache (ProofStep IDs will change after restart)
        print(f"   🗑️  Clearing {len(searcher.proof_state_cache)} cache entries")
        searcher.proof_state_cache.clear()
        
        # Mark all incomplete and pending nodes as dirty
        dirty_count = 0
        for tree in searcher.hole_trees.values():
            for node in tree.nodes.values():
                if node.status in [TacticNodeStatus.INCOMPLETE, TacticNodeStatus.PENDING]:
                    node.status = TacticNodeStatus.DIRTY
                    searcher.dirty_nodes.add(node.node_id)
                    dirty_count += 1
        
        print(f"   💫 Marked {dirty_count} nodes as dirty")
        
        # Update counters
        searcher.server_restart_count += 1
        self.nodes_executed_since_restart = 0
        self.last_restart_time = datetime.now()
        
        print(f"   ✅ Server restart #{searcher.server_restart_count} completed")
    
    def cleanup_old_cache_entries(self, searcher: NgramTacticSearcher, max_age_hours: float = 1.0) -> int:
        """Remove old cache entries to free memory"""
        cutoff_time = datetime.now() - timedelta(hours=max_age_hours)
        
        old_entries = [
            key for key, entry in searcher.proof_state_cache.items()
            if entry.execution_time < cutoff_time
        ]
        
        for key in old_entries:
            del searcher.proof_state_cache[key]
        
        if old_entries:
            print(f"🗑️  Cleaned up {len(old_entries)} old cache entries")
        
        return len(old_entries)
    
    def get_memory_report(self, searcher: NgramTacticSearcher) -> Dict:
        """Generate detailed memory usage report"""
        current_stats = self.record_memory_stats(searcher)
        
        # Calculate trends if we have history
        memory_trend = "stable"
        if len(self.memory_history) >= 2:
            recent_avg = sum(s.memory_mb for s in self.memory_history[-5:]) / min(5, len(self.memory_history))
            older_avg = sum(s.memory_mb for s in self.memory_history[-10:-5]) / min(5, len(self.memory_history))
            
            if recent_avg > older_avg * 1.1:
                memory_trend = "increasing"
            elif recent_avg < older_avg * 0.9:
                memory_trend = "decreasing"
        
        return {
            'current': current_stats.to_dict(),
            'trends': {
                'memory_trend': memory_trend,
                'total_runtime_hours': (datetime.now() - self.start_time).total_seconds() / 3600,
                'time_since_last_restart_hours': (datetime.now() - self.last_restart_time).total_seconds() / 3600
            },
            'limits': {
                'max_nodes_before_restart': self.max_nodes_before_restart,
                'max_memory_mb': self.max_memory_percent,
                'max_runtime_hours': self.max_runtime_hours
            },
            'counters': {
                'nodes_executed_since_restart': self.nodes_executed_since_restart,
                'total_server_restarts': searcher.server_restart_count if hasattr(searcher, 'server_restart_count') else 0
            },
            'restart_reasons': self.restart_reasons.copy()
        }


class CheckpointManager:
    """Manage checkpoints for resuming interrupted searches"""
    
    def __init__(self, checkpoint_dir: str = "ngram_checkpoints"):
        self.checkpoint_dir = checkpoint_dir
        os.makedirs(checkpoint_dir, exist_ok=True)
    
    def save_checkpoint(self, problem_id: str, searcher: NgramTacticSearcher, 
                       memory_manager: MemoryManager = None) -> str:
        """Save current search state to disk"""
        checkpoint_data = {
            'problem_id': problem_id,
            'timestamp': datetime.now().isoformat(),
            'searcher_config': {
                'max_depth': searcher.max_depth,
                'available_tactics': searcher.available_tactics,
                'terminal_tactics': list(searcher.terminal_tactics),
                'server_restart_count': searcher.server_restart_count,
                'total_executions': searcher.total_executions,
                'cache_hits': searcher.cache_hits,
                'cache_misses': searcher.cache_misses
            },
            'dirty_nodes': list(searcher.dirty_nodes),
            'hole_trees': {},
            'cache_entries': {},
            'memory_stats': {}
        }
        
        # Serialize hole trees
        for hole_id, tree in searcher.hole_trees.items():
            tree_data = {
                'hole_id': tree.hole_id,
                'initial_proof_state_id': tree.initial_proof_state_id,
                'root_id': tree.root_id,
                'successful_paths': tree.successful_paths,
                'max_depth': tree.max_depth,
                'nodes': {}
            }
            
            # Serialize nodes
            for node_id, node in tree.nodes.items():
                node_data = {
                    'node_id': node.node_id,
                    'hole_id': node.hole_id,
                    'tactic_sequence': node.tactic_sequence,
                    'parent_id': node.parent_id,
                    'children_ids': list(node.children_ids),
                    'status': node.status.value,
                    'proof_state_id': node.proof_state_id,
                    'error_message': node.error_message,
                    'remaining_goals': node.remaining_goals,
                    'execution_time': node.execution_time.isoformat() if node.execution_time else None,
                    'depth': node.depth,
                    'terminal_type': node.terminal_type.value,
                    'can_expand': node.can_expand
                }
                tree_data['nodes'][node_id] = node_data
            
            checkpoint_data['hole_trees'][hole_id] = tree_data
        
        # Serialize recent cache entries (not all, to keep file size manageable)
        recent_cache_limit = 100
        cache_items = list(searcher.proof_state_cache.items())
        if len(cache_items) > recent_cache_limit:
            # Keep most recent entries
            cache_items = sorted(cache_items, 
                               key=lambda x: x[1].execution_time, 
                               reverse=True)[:recent_cache_limit]
        
        for cache_key, cache_entry in cache_items:
            checkpoint_data['cache_entries'][cache_key] = {
                'tactic_sequence': cache_entry.tactic_sequence,
                'base_proof_state_id': cache_entry.base_proof_state_id,
                'status': cache_entry.status.value,
                'next_proof_state_id': cache_entry.next_proof_state_id,
                'error_message': cache_entry.error_message,
                'remaining_goals': cache_entry.remaining_goals,
                'execution_time': cache_entry.execution_time.isoformat() if cache_entry.execution_time else None
            }
        
        # Add memory stats if available
        if memory_manager:
            memory_report = memory_manager.get_memory_report(searcher)
            checkpoint_data['memory_stats'] = memory_report
        
        # Save to file
        checkpoint_file = os.path.join(self.checkpoint_dir, f"{problem_id}_ngram_checkpoint.json")
        with open(checkpoint_file, 'w') as f:
            json.dump(checkpoint_data, f, indent=2)
        
        print(f"💾 Checkpoint saved: {checkpoint_file}")
        print(f"   📊 {len(checkpoint_data['hole_trees'])} hole trees")
        print(f"   📦 {len(checkpoint_data['cache_entries'])} cache entries")
        
        return checkpoint_file
    
    def load_checkpoint(self, problem_id: str) -> Optional[Dict]:
        """Load checkpoint from disk"""
        checkpoint_file = os.path.join(self.checkpoint_dir, f"{problem_id}_ngram_checkpoint.json")
        
        if not os.path.exists(checkpoint_file):
            print(f"📂 No checkpoint found: {checkpoint_file}")
            return None
        
        try:
            with open(checkpoint_file, 'r') as f:
                checkpoint_data = json.load(f)
            
            print(f"📂 Checkpoint loaded: {checkpoint_file}")
            print(f"   🕒 Saved: {checkpoint_data['timestamp']}")
            print(f"   📊 {len(checkpoint_data['hole_trees'])} hole trees")
            print(f"   📦 {len(checkpoint_data['cache_entries'])} cache entries")
            
            return checkpoint_data
        
        except Exception as e:
            print(f"❌ Failed to load checkpoint: {e}")
            return None
    
    def restore_searcher_from_checkpoint(self, checkpoint_data: Dict) -> NgramTacticSearcher:
        """Restore searcher state from checkpoint data"""
        config = checkpoint_data['searcher_config']
        
        # Create new searcher with saved config
        searcher = NgramTacticSearcher(max_depth=config['max_depth'])
        searcher.available_tactics = config['available_tactics']
        searcher.terminal_tactics = set(config['terminal_tactics'])
        searcher.server_restart_count = config['server_restart_count']
        searcher.total_executions = config['total_executions']
        searcher.cache_hits = config['cache_hits']
        searcher.cache_misses = config['cache_misses']
        searcher.dirty_nodes = set(checkpoint_data['dirty_nodes'])
        
        # Restore hole trees
        for hole_id, tree_data in checkpoint_data['hole_trees'].items():
            tree = HoleSearchTree(
                hole_id=tree_data['hole_id'],
                initial_proof_state_id=tree_data['initial_proof_state_id'],
                max_depth=tree_data['max_depth']
            )
            tree.root_id = tree_data['root_id']
            tree.successful_paths = tree_data['successful_paths']
            
            # Restore nodes
            for node_id, node_data in tree_data['nodes'].items():
                node = TacticNode(
                    node_id=node_data['node_id'],
                    hole_id=node_data['hole_id'],
                    tactic_sequence=node_data['tactic_sequence'],
                    parent_id=node_data['parent_id'],
                    depth=node_data['depth'],
                    proof_state_id=node_data['proof_state_id'],
                    error_message=node_data['error_message'],
                    remaining_goals=node_data['remaining_goals'],
                    can_expand=node_data['can_expand']
                )
                
                # Restore enums and sets
                node.status = TacticNodeStatus(node_data['status'])
                node.terminal_type = TerminalTacticType(node_data['terminal_type'])
                node.children_ids = set(node_data['children_ids'])
                
                if node_data['execution_time']:
                    node.execution_time = datetime.fromisoformat(node_data['execution_time'])
                
                tree.nodes[node_id] = node
            
            searcher.hole_trees[hole_id] = tree
        
        # Restore cache entries
        for cache_key, cache_data in checkpoint_data['cache_entries'].items():
            cache_entry = ProofStepCacheEntry(
                tactic_sequence=cache_data['tactic_sequence'],
                base_proof_state_id=cache_data['base_proof_state_id'],
                status=TacticNodeStatus(cache_data['status']),
                next_proof_state_id=cache_data['next_proof_state_id'],
                error_message=cache_data['error_message'],
                remaining_goals=cache_data['remaining_goals'],
                execution_time=datetime.fromisoformat(cache_data['execution_time'])
            )
            searcher.proof_state_cache[cache_key] = cache_entry
        
        print(f"🔄 Searcher state restored from checkpoint")
        
        return searcher
    
    def list_checkpoints(self) -> List[Dict]:
        """List available checkpoints"""
        checkpoints = []
        
        for filename in os.listdir(self.checkpoint_dir):
            if filename.endswith('_ngram_checkpoint.json'):
                problem_id = filename[:-len('_ngram_checkpoint.json')]
                filepath = os.path.join(self.checkpoint_dir, filename)
                
                try:
                    with open(filepath, 'r') as f:
                        data = json.load(f)
                    
                    checkpoints.append({
                        'problem_id': problem_id,
                        'timestamp': data['timestamp'],
                        'hole_count': len(data['hole_trees']),
                        'cache_size': len(data['cache_entries']),
                        'file_path': filepath
                    })
                
                except Exception as e:
                    print(f"⚠️  Error reading checkpoint {filename}: {e}")
        
        return sorted(checkpoints, key=lambda x: x['timestamp'], reverse=True)


def demo_memory_management():
    """Demonstrate memory management features"""
    print("🧠 N-gram Memory Management Demo")
    print("=" * 50)
    
    # Create managers
    memory_manager = MemoryManager(
        max_nodes_before_restart=10,  # Low threshold for demo
        max_memory_percent=50,
        max_runtime_hours=0.1
    )
    
    checkpoint_manager = CheckpointManager()
    
    # Create mock searcher
    from ngram_tactic_searcher import NgramTacticSearcher
    searcher = NgramTacticSearcher(max_depth=2)
    
    print("📊 Initial memory report:")
    report = memory_manager.get_memory_report(searcher)
    for key, value in report['current'].items():
        print(f"  {key}: {value}")
    
    print(f"\n🔍 Restart check:")
    should_restart, reason = memory_manager.should_restart_server(searcher)
    print(f"  Should restart: {should_restart}")
    print(f"  Reason: {reason}")
    
    print(f"\n💾 Testing checkpoint system:")
    checkpoint_file = checkpoint_manager.save_checkpoint("demo_problem", searcher, memory_manager)
    
    print(f"\n📂 Available checkpoints:")
    checkpoints = checkpoint_manager.list_checkpoints()
    for cp in checkpoints:
        print(f"  {cp['problem_id']}: {cp['timestamp']} ({cp['hole_count']} holes)")
    
    print(f"\n✅ Memory management system ready!")


if __name__ == "__main__":
    demo_memory_management()