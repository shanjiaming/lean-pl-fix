#!/usr/bin/env python3
"""
ProofState Cache Manager - Simplified memory management solution

Implements single-interface state access with automatic state rebuilding and memory cleanup.
Core idea: external code only needs to call ensure_state_available(), internal handling of all complexity.
"""

import time
from typing import Dict, Tuple, Optional, Any
from collections import OrderedDict
from dataclasses import dataclass
from lean_interact import RemoveProofState


@dataclass
class StateInfo:
    """State information"""
    state_id: int
    last_access_time: float
    is_root: bool = False  # Root states (like pickle restored) should not be cleaned up


class ProofStateCache:
    """
    Simplified ProofState cache manager
    
    Core functionality:
    1. Maintain at most max_states states
    2. LRU cleanup of least recently used states
    3. Single interface ensure_state_available() handles all access
    """
    
    def __init__(self, max_states: int = 20, lean_server=None):
        self.max_states = max_states
        self.lean_server = lean_server
        
        # State cache: state_id -> StateInfo
        self.cache: OrderedDict[int, StateInfo] = OrderedDict()
        
        # Parent-child relationship tracking: state_id -> (parent_id, tactic)
        self.parent_map: Dict[int, Tuple[int, str]] = {}
        
        # Statistics
        self.stats = {
            'cache_hits': 0,
            'cache_misses': 0,
            'states_removed': 0,
            'states_regenerated': 0
        }
    
    def set_lean_server(self, lean_server):
        """Set Lean server instance"""
        self.lean_server = lean_server
    
    def ensure_state_available(self, state_id: int) -> int:
        """
        Core interface to ensure state availability
        
        If state is in cache, return directly and update access time
        If not in cache, recursively rebuild parent state chain, then regenerate target state
        
        Args:
            state_id: Target state ID
            
        Returns:
            Available state ID (possibly regenerated)
        """
        # Check cache
        if state_id in self.cache:
            # Cache hit - update access time and LRU order
            self.cache.move_to_end(state_id)  # Move to most recently used position
            self.cache[state_id].last_access_time = time.time()
            self.stats['cache_hits'] += 1
            print(f"   💾 Cache hit: state {state_id}")
            return state_id
        
        # Cache miss - need to rebuild
        self.stats['cache_misses'] += 1
        print(f"   🔄 Cache miss: rebuilding state {state_id}")
        
        # Check if we have parent state information
        if state_id not in self.parent_map:
            # For root states that were removed from cache, we can't rebuild them
            # This happens when accessing original proof states that have no parent
            print(f"   ⚠️  No parent information for state {state_id}. Assuming it's still valid in Lean server.")
            
            # Re-register as root state and return
            self._add_to_cache(state_id, is_root=True)
            return state_id
        
        parent_id, tactic = self.parent_map[state_id]
        
        # Recursively ensure parent state is available
        available_parent_id = self.ensure_state_available(parent_id)
        
        # Regenerate target state from parent state
        new_state_id = self._regenerate_state_from_parent(available_parent_id, tactic)
        
        # Update parent-child relationships (new state ID might be different)
        if new_state_id != state_id:
            # Update all parent-child relationships pointing to old state_id
            self._update_parent_references(state_id, new_state_id)
        
        # Register new state to cache
        self._add_to_cache(new_state_id, is_root=False)
        
        self.stats['states_regenerated'] += 1
        print(f"   ✅ Rebuilt state: {state_id} -> {new_state_id}")
        
        return new_state_id
    
    def register_state(self, state_id: int, parent_id: Optional[int] = None, 
                      tactic: Optional[str] = None, is_root: bool = False):
        """
        Register new state to cache
        
        Args:
            state_id: New state ID
            parent_id: Parent state ID (if any)
            tactic: Tactic that generated this state (if any)
            is_root: Whether this is a root state (should not be cleaned up)
        """
        # Record parent-child relationship
        if parent_id is not None and tactic is not None:
            self.parent_map[state_id] = (parent_id, tactic)
        
        # Add to cache
        self._add_to_cache(state_id, is_root)
        
        print(f"   📝 Registered state {state_id}" + 
              (f" (parent: {parent_id}, tactic: {tactic})" if parent_id else " (root)"))
    
    def _add_to_cache(self, state_id: int, is_root: bool = False):
        """Add state to cache, perform LRU cleanup when necessary"""
        current_time = time.time()
        
        # Add state information
        state_info = StateInfo(
            state_id=state_id,
            last_access_time=current_time,
            is_root=is_root
        )
        
        self.cache[state_id] = state_info
        
        # Check if cleanup is needed
        if len(self.cache) > self.max_states:
            self._cleanup_lru_states()
    
    def _cleanup_lru_states(self):
        """Clean up least recently used states"""
        states_to_remove = len(self.cache) - self.max_states + 1  # Clean up 1 extra state
        
        removed_count = 0
        states_to_remove_list = []
        
        # Find states to clean up starting from least recently used
        for state_id, state_info in list(self.cache.items()):
            if removed_count >= states_to_remove:
                break
                
            # Don't clean up root states
            if state_info.is_root:
                continue
                
            states_to_remove_list.append(state_id)
            removed_count += 1
        
        # Execute cleanup
        for state_id in states_to_remove_list:
            self._remove_state_from_cache(state_id)
        
        print(f"   🧹 LRU cleanup: removed {removed_count} states, cache size: {len(self.cache)}")
    
    def _remove_state_from_cache(self, state_id: int):
        """Remove state from cache and call Lean server cleanup"""
        if state_id in self.cache:
            del self.cache[state_id]
            
            # Call Lean server to clean up state
            if self.lean_server:
                try:
                    self.lean_server.run(RemoveProofState(remove_proof_state=state_id))
                    print(f"   🗑️  Removed state {state_id} from Lean server")
                except Exception as e:
                    print(f"   ⚠️  Failed to remove state {state_id} from Lean server: {e}")
            
            self.stats['states_removed'] += 1
    
    def _regenerate_state_from_parent(self, parent_id: int, tactic: str) -> int:
        """Regenerate target state from parent state"""
        if not self.lean_server:
            raise RuntimeError("No Lean server available for state regeneration")
        
        try:
            from lean_interact import ProofStep
            
            print(f"   🔧 Regenerating: parent {parent_id} + tactic '{tactic}'")
            response = self.lean_server.run(ProofStep(
                proof_state=parent_id,
                tactic=tactic
            ))
            
            # Check response
            from lean_interact.interface import LeanError
            if isinstance(response, LeanError):
                raise RuntimeError(f"ProofStep failed: {response.message}")
            
            if not hasattr(response, 'proof_state'):
                raise RuntimeError(f"ProofStep response missing proof_state")
            
            new_state_id = response.proof_state
            print(f"   ✅ Generated new state: {new_state_id}")
            return new_state_id
            
        except Exception as e:
            raise RuntimeError(f"Failed to regenerate state from parent {parent_id}: {e}")
    
    def _update_parent_references(self, old_state_id: int, new_state_id: int):
        """Update all parent-child relationships pointing to old state ID"""
        # Update all relationships in parent_map that have old_state_id as parent
        for child_id, (parent_id, tactic) in list(self.parent_map.items()):
            if parent_id == old_state_id:
                self.parent_map[child_id] = (new_state_id, tactic)
        
        # If old_state_id itself has parent relationship, copy to new_state_id
        if old_state_id in self.parent_map:
            self.parent_map[new_state_id] = self.parent_map[old_state_id]
    
    def get_cache_info(self) -> Dict[str, Any]:
        """Get cache statistics information"""
        return {
            'cache_size': len(self.cache),
            'max_states': self.max_states,
            'parent_relationships': len(self.parent_map),
            'stats': self.stats.copy(),
            'hit_rate': (self.stats['cache_hits'] / 
                        max(1, self.stats['cache_hits'] + self.stats['cache_misses']) * 100)
        }
    
    def clear_cache(self):
        """Clear cache (for testing)"""
        # Clean up all non-root states
        states_to_remove = [
            state_id for state_id, state_info in self.cache.items() 
            if not state_info.is_root
        ]
        
        for state_id in states_to_remove:
            self._remove_state_from_cache(state_id)
        
        print(f"   🧹 Cache cleared: removed {len(states_to_remove)} states")


def demo_proofstate_cache():
    """Demonstrate ProofState cache manager"""
    print("🔧 ProofState Cache Manager Demo")
    print("=" * 50)
    
    cache = ProofStateCache(max_states=5)  # Small capacity for demo
    
    print("✅ Cache manager initialized")
    print(f"   Max states: {cache.max_states}")
    print(f"   Cache size: {len(cache.cache)}")
    
    print(f"\n💡 Key Features:")
    print(f"   - Single interface: ensure_state_available(state_id)")
    print(f"   - Automatic LRU cleanup when exceeding max_states")
    print(f"   - Recursive state rebuilding from parent chain")
    print(f"   - Transparent integration with existing code")
    
    print(f"\n🎯 Usage:")
    print(f"   cache.set_lean_server(lean_server)")
    print(f"   cache.register_state(state_id, parent_id, tactic)")
    print(f"   available_state = cache.ensure_state_available(state_id)")


if __name__ == "__main__":
    demo_proofstate_cache()