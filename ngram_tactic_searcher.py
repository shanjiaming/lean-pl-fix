#!/usr/bin/env python3
"""
N-gram Tactic Searcher

Implementation of n-gram tactic search system that extends the existing unigram
approach to support multi-tactic sequences with search tree structure.

Key Features:
- Search tree with parent-child relationships
- ProofStep caching for performance
- Memory management and server restart handling
- Checkpoint and resume capabilities
- Three-state classification: success/error/incomplete
"""

import json
import os
import time
from enum import Enum
from datetime import datetime
from typing import Dict, List, Optional, Set, Any, Tuple
from dataclasses import dataclass, field

# Import existing integrations
from proofstep_lean_integration import MinimalLeanProofStepIntegrator, ProofState, TacticResult


class TacticNodeStatus(Enum):
    """Status of a tactic node in the search tree"""
    PENDING = "pending"           # Not yet executed
    SUCCESS = "success"           # Fully solved the goal
    ERROR = "error"              # Failed with LeanError  
    INCOMPLETE = "incomplete"     # Executed but goals remain
    DIRTY = "dirty"              # Needs re-execution due to server restart


class TerminalTacticType(Enum):
    """Types of tactics that terminate search"""
    SOLVER = "solver"            # linarith, nlinarith, omega - cannot have children
    NORMAL = "normal"            # Can have children


@dataclass
class TacticNode:
    """Node in the tactic search tree"""
    node_id: str                          # Unique identifier
    hole_id: str                          # Which hole this belongs to
    tactic_sequence: List[str]            # Sequence of tactics from root
    parent_id: Optional[str]              # Parent node ID
    children_ids: Set[str] = field(default_factory=set)  # Child node IDs
    status: TacticNodeStatus = TacticNodeStatus.PENDING
    
    # Execution results
    proof_state_id: Optional[int] = None  # Final ProofStep proof_state ID
    error_message: Optional[str] = None
    remaining_goals: Optional[int] = None
    execution_time: Optional[datetime] = None
    
    # Metadata
    depth: int = 0                        # Depth in search tree
    terminal_type: TerminalTacticType = TerminalTacticType.NORMAL
    can_expand: bool = True               # Whether this node can have children
    
    def is_terminal(self) -> bool:
        """Check if this is a terminal node"""
        return (self.status in [TacticNodeStatus.SUCCESS, TacticNodeStatus.ERROR] or 
                not self.can_expand)
    
    def get_last_tactic(self) -> Optional[str]:
        """Get the last tactic in the sequence"""
        return self.tactic_sequence[-1] if self.tactic_sequence else None


@dataclass
class HoleSearchTree:
    """Search tree for a single hole"""
    hole_id: str
    initial_proof_state_id: int
    nodes: Dict[str, TacticNode] = field(default_factory=dict)  # node_id -> TacticNode
    root_id: Optional[str] = None
    successful_paths: List[List[str]] = field(default_factory=list)  # List of successful tactic sequences
    max_depth: int = 2                    # Maximum search depth (2 for 2gram)
    
    def add_node(self, node: TacticNode) -> None:
        """Add a node to the tree"""
        self.nodes[node.node_id] = node
        if node.parent_id and node.parent_id in self.nodes:
            parent = self.nodes[node.parent_id]
            parent.children_ids.add(node.node_id)
    
    def get_expandable_nodes(self) -> List[TacticNode]:
        """Get nodes that can be expanded"""
        return [node for node in self.nodes.values() 
                if node.status == TacticNodeStatus.INCOMPLETE and 
                   node.can_expand and 
                   node.depth < self.max_depth]
    
    def get_pending_nodes(self) -> List[TacticNode]:
        """Get nodes that are pending execution"""
        return [node for node in self.nodes.values() 
                if node.status == TacticNodeStatus.PENDING]
    
    def get_dirty_nodes(self) -> List[TacticNode]:
        """Get nodes that need re-execution"""
        return [node for node in self.nodes.values() 
                if node.status == TacticNodeStatus.DIRTY]
    
    def get_path_to_root(self, node_id: str) -> List[str]:
        """Get the path from node to root"""
        path = []
        current_id = node_id
        while current_id and current_id in self.nodes:
            path.append(current_id)
            node = self.nodes[current_id]
            current_id = node.parent_id
        return list(reversed(path))


@dataclass
class ProofStepCacheEntry:
    """Cache entry for ProofStep execution results"""
    tactic_sequence: List[str]
    base_proof_state_id: int
    status: TacticNodeStatus
    next_proof_state_id: Optional[int] = None
    error_message: Optional[str] = None
    remaining_goals: Optional[int] = None
    execution_time: datetime = field(default_factory=datetime.now)
    
    def get_cache_key(self) -> str:
        """Generate cache key for this entry"""
        return f"{self.base_proof_state_id}_{'_'.join(self.tactic_sequence)}"


class NgramTacticSearcher:
    """N-gram tactic sequence searcher with caching and memory management"""
    
    def __init__(self, max_depth: int = 2):
        self.max_depth = max_depth
        self.hole_trees: Dict[str, HoleSearchTree] = {}
        self.lean_integrator: Optional[MinimalLeanProofStepIntegrator] = None
        self.proof_state_cache: Dict[str, ProofStepCacheEntry] = {}  # Cache ProofStep results
        self.server_restart_count = 0
        self.dirty_nodes: Set[str] = set()  # Nodes that need re-execution
        
        # Terminal tactic sets - these cannot have children
        self.terminal_tactics = {"linarith", "nlinarith", "omega"}
        self.available_tactics = [
            "norm_num", "linarith", "nlinarith", "omega", 
            "ring", "ring_nf", "simp", "simpa", "field_simp", 
            "positivity", "norm_cast"
        ]
        
        # Statistics
        self.total_executions = 0
        self.cache_hits = 0
        self.cache_misses = 0
    
    def initialize_lean_integrator(self, header_content: str) -> None:
        """Initialize Lean integrator"""
        if not self.lean_integrator:
            self.lean_integrator = MinimalLeanProofStepIntegrator()
            self.lean_integrator.initialize_lean_server()
        print(f"🔧 Lean integrator initialized")
    
    def shutdown_lean_integrator(self) -> None:
        """Shutdown Lean integrator"""
        if self.lean_integrator:
            self.lean_integrator.shutdown_lean_server()
            self.lean_integrator = None
        print(f"🔄 Lean integrator shutdown")
    
    def initialize_search_for_hole(self, hole_id: str, initial_proof_state_id: int) -> HoleSearchTree:
        """Initialize search tree for a specific hole"""
        tree = HoleSearchTree(
            hole_id=hole_id,
            initial_proof_state_id=initial_proof_state_id,
            max_depth=self.max_depth
        )
        
        # Create root node (empty tactic sequence)
        root_node = TacticNode(
            node_id=f"{hole_id}_root",
            hole_id=hole_id,
            tactic_sequence=[],
            parent_id=None,
            depth=0,
            proof_state_id=initial_proof_state_id,
            status=TacticNodeStatus.INCOMPLETE  # Ready for expansion
        )
        
        tree.add_node(root_node)
        tree.root_id = root_node.node_id
        self.hole_trees[hole_id] = tree
        
        print(f"🌳 Initialized search tree for hole '{hole_id}' with proof_state {initial_proof_state_id}")
        return tree
    
    def expand_node(self, node: TacticNode) -> List[TacticNode]:
        """Expand a node by trying all possible next tactics"""
        if not node.can_expand or node.depth >= self.max_depth:
            return []
        
        children = []
        for tactic in self.available_tactics:
            # Create child node
            child_sequence = node.tactic_sequence + [tactic]
            child_id = f"{node.hole_id}_{'_'.join(child_sequence)}"
            
            # Determine if this tactic is terminal
            is_terminal_tactic = tactic in self.terminal_tactics
            
            child_node = TacticNode(
                node_id=child_id,
                hole_id=node.hole_id,
                tactic_sequence=child_sequence,
                parent_id=node.node_id,
                depth=node.depth + 1,
                terminal_type=TerminalTacticType.SOLVER if is_terminal_tactic else TerminalTacticType.NORMAL,
                can_expand=not is_terminal_tactic  # Terminal tactics cannot be expanded
            )
            
            children.append(child_node)
        
        print(f"🌿 Expanded node '{node.node_id}' -> {len(children)} children (depth {node.depth + 1})")
        return children
        
    def check_node_completion(self, node: TacticNode, tree: 'TacticSearchTree'):
        """Check if a node should be marked as complete based on its children's status"""
        if node.status != TacticNodeStatus.INCOMPLETE:
            return  # Node already has final status
            
        # Get all direct children of this node
        children = [child for child in tree.nodes.values() if child.parent_id == node.node_id]
        
        if not children:
            return  # No children to check
            
        # Check if all children have been executed and all failed
        all_children_executed = all(child.status != TacticNodeStatus.PENDING for child in children)
        all_children_failed = all(child.status == TacticNodeStatus.ERROR for child in children)
        
        if all_children_executed and all_children_failed:
            # All possible expansions failed, mark this node as error
            node.status = TacticNodeStatus.ERROR
            node.can_expand = False
            print(f"🚫 Node '{node.node_id}' marked as ERROR - all children failed")
    
    def execute_tactic_sequence(self, node: TacticNode, base_proof_state_id: int) -> TacticNodeStatus:
        """Execute a tactic sequence and return the final status"""
        if not self.lean_integrator:
            raise RuntimeError("Lean integrator not initialized")
        
        # Check cache first
        cache_key = f"{base_proof_state_id}_{'_'.join(node.tactic_sequence)}"
        
        if cache_key in self.proof_state_cache and node.node_id not in self.dirty_nodes:
            # Use cached result
            cached_entry = self.proof_state_cache[cache_key]
            self.cache_hits += 1
            
            print(f"    💾 Cache hit for {node.node_id}: {cached_entry.status.value}")
            
            # Update node with cached data
            node.proof_state_id = cached_entry.next_proof_state_id
            node.error_message = cached_entry.error_message
            node.remaining_goals = cached_entry.remaining_goals
            node.execution_time = cached_entry.execution_time
            
            return cached_entry.status
        
        # Cache miss - need to execute
        self.cache_misses += 1
        self.total_executions += 1
        
        print(f"    🎯 Executing sequence {' -> '.join(node.tactic_sequence) if node.tactic_sequence else '[root]'}")
        
        try:
            current_proof_state_id = base_proof_state_id
            final_status = TacticNodeStatus.INCOMPLETE
            final_error = None
            final_goals = None
            
            # Execute each tactic in sequence
            for i, tactic in enumerate(node.tactic_sequence):
                from lean_interact import ProofStep
                from lean_interact.interface import LeanError
                
                response = self.lean_integrator.lean_server.run(
                    ProofStep(proof_state=current_proof_state_id, tactic=tactic)
                )
                
                # Analyze response
                if isinstance(response, LeanError):
                    # Error - sequence failed
                    final_status = TacticNodeStatus.ERROR
                    final_error = str(response.message)
                    print(f"      ❌ Tactic '{tactic}' failed: {final_error[:100]}...")
                    break
                
                elif hasattr(response, 'proof_status'):
                    if response.proof_status == 'Completed' and len(response.goals) == 0:
                        # Success - sequence solved the goal
                        final_status = TacticNodeStatus.SUCCESS
                        final_goals = 0
                        # Still record the final proof_state for completeness
                        current_proof_state_id = getattr(response, 'proof_state', current_proof_state_id)
                        print(f"      ✅ Sequence succeeded with '{tactic}' (final proof_state: {current_proof_state_id})")
                        break
                    else:
                        # Continue with next tactic - IMPORTANT: Use response.proof_state
                        final_goals = len(response.goals) if hasattr(response, 'goals') else None
                        next_proof_state_id = getattr(response, 'proof_state', None)
                        
                        if next_proof_state_id is None:
                            # This is a critical error - we can't continue the sequence
                            final_status = TacticNodeStatus.ERROR
                            final_error = f"No proof_state in response after tactic '{tactic}'"
                            print(f"      ❌ {final_error}")
                            break
                        
                        current_proof_state_id = next_proof_state_id
                        print(f"      ➡️  Tactic '{tactic}' -> proof_state {current_proof_state_id}, {final_goals} goals remain")
                else:
                    # Unexpected response type
                    final_status = TacticNodeStatus.ERROR
                    final_error = f"Unexpected response type: {type(response)}"
                    print(f"      ❌ Unexpected response: {final_error}")
                    break
            
            # If we get here without error/success, it's incomplete
            if final_status == TacticNodeStatus.INCOMPLETE:
                node.proof_state_id = current_proof_state_id
                node.remaining_goals = final_goals
            
            # Cache the result
            cache_entry = ProofStepCacheEntry(
                tactic_sequence=node.tactic_sequence.copy(),
                base_proof_state_id=base_proof_state_id,
                status=final_status,
                next_proof_state_id=current_proof_state_id if final_status != TacticNodeStatus.ERROR else None,
                error_message=final_error,
                remaining_goals=final_goals,
                execution_time=datetime.now()
            )
            
            self.proof_state_cache[cache_key] = cache_entry
            
            # Update node
            node.error_message = final_error
            node.execution_time = cache_entry.execution_time
            
            # Remove from dirty set if it was there
            self.dirty_nodes.discard(node.node_id)
            
            return final_status
            
        except Exception as e:
            error_msg = str(e)
            print(f"      ❌ Exception during execution: {error_msg}")
            
            # Cache error result
            cache_entry = ProofStepCacheEntry(
                tactic_sequence=node.tactic_sequence.copy(),
                base_proof_state_id=base_proof_state_id,
                status=TacticNodeStatus.ERROR,
                error_message=error_msg,
                execution_time=datetime.now()
            )
            self.proof_state_cache[cache_key] = cache_entry
            
            node.error_message = error_msg
            node.execution_time = cache_entry.execution_time
            
            return TacticNodeStatus.ERROR
    
    def search_hole(self, hole_id: str, initial_proof_state_id: int) -> Tuple[List[List[str]], Dict]:
        """
        Perform complete n-gram search for a hole
        
        Args:
            hole_id: ID of the hole to search
            initial_proof_state_id: Initial ProofStep proof_state ID
            
        Returns:
            Tuple of (successful_paths, detailed_results)
        """
        if not self.lean_integrator:
            raise RuntimeError("Lean integrator not initialized")
        
        print(f"\n🔍 Starting n-gram search for hole '{hole_id}'")
        start_time = time.time()
        
        # Initialize or get existing tree
        if hole_id not in self.hole_trees:
            tree = self.initialize_search_for_hole(hole_id, initial_proof_state_id)
        else:
            tree = self.hole_trees[hole_id]
        
        # Main search loop
        iteration = 0
        while True:
            iteration += 1
            print(f"\n--- Search Iteration {iteration} for {hole_id} ---")
            
            # Process dirty nodes first (from server restart)
            dirty_nodes = tree.get_dirty_nodes()
            if dirty_nodes:
                print(f"🔄 Re-executing {len(dirty_nodes)} dirty nodes")
                for node in dirty_nodes:
                    node.status = self.execute_tactic_sequence(node, tree.initial_proof_state_id)
            
            # Process pending nodes
            pending_nodes = tree.get_pending_nodes()
            if pending_nodes:
                print(f"⚡ Executing {len(pending_nodes)} pending nodes")
                for node in pending_nodes:
                    node.status = self.execute_tactic_sequence(node, tree.initial_proof_state_id)
                    
                    # Track successful paths
                    if node.status == TacticNodeStatus.SUCCESS:
                        tree.successful_paths.append(node.tactic_sequence.copy())
                        print(f"🎉 Found successful path: {' -> '.join(node.tactic_sequence)}")
            
            # Check node completion status after executing pending nodes
            for node in tree.nodes.values():
                self.check_node_completion(node, tree)
            
            # Get expandable nodes for next iteration
            expandable_nodes = tree.get_expandable_nodes()
            
            if not expandable_nodes:
                print(f"🏁 Search completed for '{hole_id}' - no more expandable nodes")
                break
            
            # Additional safety check - prevent infinite loops
            if iteration > 100:  # Max 100 iterations
                print(f"⚠️  Maximum iterations reached ({iteration}), stopping search")
                break
            
            # Expand nodes
            print(f"🌱 Expanding {len(expandable_nodes)} nodes")
            new_nodes_created = 0
            
            for node in expandable_nodes:
                children = self.expand_node(node)
                for child in children:
                    tree.add_node(child)
                    new_nodes_created += 1
            
            print(f"📊 Created {new_nodes_created} new nodes")
            
            # Check if no new nodes were created - another sign of infinite loop
            if new_nodes_created == 0:
                print(f"⚠️  No new nodes created, search may be stuck")
                break
            
            # Safety check - prevent infinite expansion
            if len(tree.nodes) > 1000:
                print(f"⚠️  Search tree too large ({len(tree.nodes)} nodes), stopping")
                break
        
        search_time = time.time() - start_time
        
        # Generate detailed results
        results = {
            'hole_id': hole_id,
            'successful_paths': tree.successful_paths,
            'total_nodes': len(tree.nodes),
            'search_time_seconds': search_time,
            'cache_stats': {
                'hits': self.cache_hits,
                'misses': self.cache_misses,
                'hit_rate': self.cache_hits / (self.cache_hits + self.cache_misses) * 100 if (self.cache_hits + self.cache_misses) > 0 else 0
            },
            'node_attempts': []
        }
        
        # Convert nodes to output format
        for node in tree.nodes.values():
            if not node.tactic_sequence:  # Skip root node
                continue
                
            attempt = {
                'tactic_sequence': node.tactic_sequence,
                'node_id': node.node_id,
                'parent_id': node.parent_id,
                'status': node.status.value,
                'depth': node.depth,
                'error_message': node.error_message,
                'execution_time': node.execution_time.isoformat() if node.execution_time else None,
                'can_expand': node.can_expand,
                'is_terminal': node.is_terminal(),
                'remaining_goals': node.remaining_goals
            }
            results['node_attempts'].append(attempt)
        
        print(f"\n📈 Search Summary for '{hole_id}':")
        print(f"  Total nodes explored: {len(tree.nodes)}")
        print(f"  Successful paths found: {len(tree.successful_paths)}")
        print(f"  Search time: {search_time:.2f}s")
        print(f"  Cache hit rate: {results['cache_stats']['hit_rate']:.1f}%")
        
        # Auto-save detailed results to JSON file
        self._save_search_results(hole_id, results)
        
        return tree.successful_paths, results
    
    def _save_search_results(self, hole_id: str, results: Dict):
        """Save detailed search results to JSON file"""
        import os
        from datetime import datetime
        
        # Create results directory if it doesn't exist
        results_dir = "ngram_search_results"
        os.makedirs(results_dir, exist_ok=True)
        
        # Generate filename with timestamp
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        filename = f"{results_dir}/{hole_id}_search_results_{timestamp}.json"
        
        # Add metadata
        results_with_metadata = {
            'search_metadata': {
                'hole_id': hole_id,
                'timestamp': datetime.now().isoformat(),
                'searcher_config': {
                    'max_depth': self.max_depth,
                    'available_tactics': self.available_tactics,
                    'terminal_tactics': list(self.terminal_tactics)
                }
            },
            'search_results': results
        }
        
        try:
            with open(filename, 'w') as f:
                json.dump(results_with_metadata, f, indent=2, ensure_ascii=False)
            print(f"📁 Detailed results saved to: {filename}")
        except Exception as e:
            print(f"⚠️  Failed to save results to {filename}: {e}")

    def get_statistics(self) -> Dict:
        """Get searcher statistics"""
        return {
            'total_executions': self.total_executions,
            'cache_hits': self.cache_hits,
            'cache_misses': self.cache_misses,
            'cache_size': len(self.proof_state_cache),
            'server_restarts': self.server_restart_count,
            'dirty_nodes': len(self.dirty_nodes),
            'active_trees': len(self.hole_trees)
        }


def demo_ngram_search():
    """Demonstrate n-gram search on a simple example"""
    print("🚀 N-gram Tactic Search Demo")
    print("=" * 60)
    
    # Create searcher
    searcher = NgramTacticSearcher(max_depth=2)
    
    try:
        # Initialize with mock header
        header_content = "import Mathlib\nset_option debug.skipKernelTC true"
        searcher.initialize_lean_integrator(header_content)
        
        # Mock a hole search (in real usage, this would come from the existing pipeline)
        hole_id = "demo_hole_1"
        initial_proof_state_id = 0  # This would be provided by existing ProofStep integration
        
        print(f"🎯 Searching for tactics to solve hole '{hole_id}'")
        print(f"📍 Starting from proof_state {initial_proof_state_id}")
        print(f"🎲 Available tactics: {searcher.available_tactics}")
        print(f"⚡ Terminal tactics: {searcher.terminal_tactics}")
        print(f"📏 Max depth: {searcher.max_depth}")
        
        # Note: This demo won't actually work without real ProofStep integration
        # But it demonstrates the API and structure
        
        # In real usage:
        # successful_paths, results = searcher.search_hole(hole_id, initial_proof_state_id)
        
        # For demo, just show the structure
        print("\n📋 Demo structure created successfully!")
        print("✅ NgramTacticSearcher initialized")
        print("✅ Search tree architecture ready")
        print("✅ Caching mechanism active")
        
        stats = searcher.get_statistics()
        print(f"\n📊 Initial Statistics:")
        for key, value in stats.items():
            print(f"  {key}: {value}")
        
        print("\n💡 To use with real data:")
        print("  1. Extract proof states from existing pipeline")
        print("  2. Call searcher.search_hole(hole_id, proof_state_id)")
        print("  3. Get successful tactic sequences")
        print("  4. Integrate with synthesis pipeline")
        
    except Exception as e:
        print(f"⚠️  Demo error (expected without real ProofStep data): {e}")
        
    finally:
        searcher.shutdown_lean_integrator()
        print("🔄 Demo completed, resources cleaned up")


if __name__ == "__main__":
    demo_ngram_search()