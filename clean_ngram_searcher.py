#!/usr/bin/env python3
"""
Clean N-gram Searcher for Pickle Mode

Simplified searcher specifically designed for the pickle-based pipeline.
No complex memory management, checkpoints, or server restart handling.
Pure search logic with clean state management.
"""

import json
import time
from enum import Enum
from datetime import datetime
from typing import Dict, List, Optional, Set, Tuple
from dataclasses import dataclass, field

import psutil
from proofstep_lean_integration import MinimalLeanProofStepIntegrator

# Assuming HolePickleInfo is defined elsewhere, or define it here for clarity
@dataclass
class HolePickleInfo:
    hole_id: str
    pickle_file: str

class NodeStatus(Enum):
    """Simple node status"""
    PENDING = "pending"
    SUCCESS = "success" 
    ERROR = "error"
    INCOMPLETE = "incomplete"


@dataclass
class SearchNode:
    """Simple search node"""
    node_id: str
    tactic_sequence: List[str]
    parent_id: Optional[str]
    status: NodeStatus = NodeStatus.PENDING
    children: Set[str] = field(default_factory=set)
    depth: int = 0
    proof_state_id: Optional[int] = None
    server_generation: int = 0 # Tracks which Lean server instance this state belongs to
    error_message: Optional[str] = None
    remaining_goals: int = 0
    
    def get_last_tactic(self) -> Optional[str]:
        return self.tactic_sequence[-1] if self.tactic_sequence else None
    
    def is_terminal(self) -> bool:
        """Check if this node should not be expanded further"""
        return (self.status in [NodeStatus.SUCCESS, NodeStatus.ERROR] or
                self.get_last_tactic() in ['linarith', 'nlinarith', 'omega'])


@dataclass 
class SearchResults:
    """Search results for a hole"""
    hole_id: str
    successful_paths: List[List[str]]
    total_nodes: int
    search_time_seconds: float
    nodes_by_status: Dict[str, int]
    max_depth_reached: int


class CleanNgramSearcher:
    """Clean n-gram searcher for pickle mode"""
    
    def __init__(self, max_depth: int = 2, stop_on_first_success: bool = True):
        self.max_depth = max_depth
        self.stop_on_first_success = stop_on_first_success
        
        # Simple tactic list
        self.available_tactics = ["norm_num", "linarith", "nlinarith", "omega", "ring", "ring_nf", "simp", "simpa", "field_simp", "positivity", "norm_cast"]
        
        self.terminal_tactics = {'linarith', 'nlinarith', 'omega'}
        
        # Current search state
        self.nodes: Dict[str, SearchNode] = {}
        self.successful_paths: List[List[str]] = []
        self.proofsteps_executed_since_restart = 0
        self.max_memory_percent = 70
        self.proofstep_check_interval = 20
        self.lean_integrator: Optional[MinimalLeanProofStepIntegrator] = None
        
        # Memory management & Server Generation
        self.lean_server_generation = 0

        # Detailed search log
        self.explored_nodes_log: List[Dict] = []
    
    def _check_and_restart_server(self, pickle_info: HolePickleInfo, loader_func, root_node: SearchNode):
        """Checks memory and restarts the server if needed. Minimal logic here."""
        self.proofsteps_executed_since_restart += 1
        if self.proofsteps_executed_since_restart % self.proofstep_check_interval != 0:
            return

        current_memory_percent = psutil.virtual_memory().percent
        if current_memory_percent > self.max_memory_percent:
            print(f"      🧠 Memory usage {current_memory_percent:.1f}% > {self.max_memory_percent}%. Restarting Lean server...")
            
            # 1. Shutdown and restart integrator
            if self.lean_integrator:
                self.lean_integrator.shutdown_lean_server()
                self.lean_integrator.initialize_lean_server()
            
            # 2. Increment server generation
            self.lean_server_generation += 1
            print(f"      🔥 New server generation: {self.lean_server_generation}")

            # 3. Reload initial proof state from pickle
            new_root_ps_id = loader_func(pickle_info, self.lean_integrator)
            if new_root_ps_id is None:
                print("      💥 FATAL: Failed to reload pickle after server restart. Aborting search.")
                raise RuntimeError("Failed to reload pickle.")
            
            root_node.proof_state_id = new_root_ps_id
            root_node.server_generation = self.lean_server_generation
            root_node.status = NodeStatus.PENDING # Ensure root is ready for expansion
            print(f"      🔄 Server restarted. New root proof state ID: {new_root_ps_id}")
            
            # Reset counter
            self.proofsteps_executed_since_restart = 0

    def _ensure_node_state_is_valid(self, node: SearchNode):
        """Just-In-Time state recovery. Recursively ensures a node's state is valid."""
        # If the node's state is from the current server generation, it's valid.
        if node.server_generation == self.lean_server_generation and node.proof_state_id is not None:
            return

        # Cannot recover a node without a parent (the root should be handled by _check_and_restart_server)
        if node.parent_id is None:
            if node.proof_state_id is None:
                 raise RuntimeError(f"Root node {node.node_id} has no valid proof state.")
            return

        parent = self.nodes.get(node.parent_id)
        if not parent:
            raise RuntimeError(f"Could not find parent node {node.parent_id} for node {node.node_id}")

        # Recursively ensure the parent is valid first.
        self._ensure_node_state_is_valid(parent)

        # Now that the parent is guaranteed to be valid, regenerate the current node's state.
        print(f"         🔄 JIT Recovery: Re-evaluating {node.node_id} from parent {parent.node_id}")
        self._execute_single_tactic(node, parent.proof_state_id)

    def search_hole(self, pickle_info: HolePickleInfo, initial_proof_state_id: int, loader_func) -> Tuple[List[List[str]], Dict]:
        """Search for solutions to a specific hole"""
        
        print(f"      🔍 Starting n-gram search for {pickle_info.hole_id} (PS_{initial_proof_state_id})")
        start_time = time.time()
        
        # Reset state
        self.nodes.clear()
        self.successful_paths.clear()
        self.proofsteps_executed_since_restart = 0
        self.lean_server_generation = 0

        # Initialize results_dict early so it can be returned at any time
        results_dict = {
            'hole_id': pickle_info.hole_id,
            'successful_paths': self.successful_paths.copy(),
            'total_nodes': 0, # Will be updated before final return
            'search_time_seconds': 0.0, # Will be updated before final return
            'nodes_by_status': {}, # Will be updated before final return
            'max_depth_reached': 0,
            'search_completed': False,
            'stop_on_first_success': self.stop_on_first_success,
            'explored_nodes_log': [] # Initialize empty, will be populated
        }
        
        # Create root node
        root_id = f"{pickle_info.hole_id}_root"
        root_node = SearchNode(
            node_id=root_id,
            tactic_sequence=[],
            parent_id=None,
            depth=0,
            proof_state_id=initial_proof_state_id,
            status=NodeStatus.PENDING,
            server_generation=self.lean_server_generation
        )
        self.nodes[root_id] = root_node
        self.explored_nodes_log.append({
            'node_id': root_node.node_id,
            'tactic_sequence': root_node.tactic_sequence,
            'depth': root_node.depth,
            'status': root_node.status.value
        })
        
        # Search iteratively by depth
        nodes_to_process = [root_node]
        current_depth = 0
        
        while nodes_to_process and current_depth < self.max_depth:
            print(f"         📊 Depth {current_depth}: processing {len(nodes_to_process)} nodes")
            
            # Check for global success before processing current depth's nodes
            if self.stop_on_first_success and self.successful_paths:
                print(f"         🏁 Stopping early (success found at previous depth)")
                break

            next_nodes = []
            
            for node in nodes_to_process:
                # Ensure this node's state is valid before trying to expand it.
                self._ensure_node_state_is_valid(node)

                # If recovery marked the node as errored, or it's otherwise terminal, skip.
                if node.is_terminal():
                    continue
                
                children = self._expand_node(node, pickle_info.hole_id, pickle_info, loader_func, root_node)
                next_nodes.extend(children)
                
                # Check for success immediately
                for child in children:
                    if child.status == NodeStatus.SUCCESS:
                        self.successful_paths.append(child.tactic_sequence.copy())
                        print(f"         🎉 Success: {' -> '.join(child.tactic_sequence)}")
                        
                        # If stop_on_first_success, immediately break all loops and return
                        if self.stop_on_first_success:
                            print(f"         🏁 Stopping early (first success found at current depth)")
                            # Populate final stats before returning
                            results_dict['successful_paths'] = self.successful_paths.copy()
                            results_dict['total_nodes'] = len(self.nodes)
                            results_dict['search_time_seconds'] = time.time() - start_time
                            results_dict['nodes_by_status'] = {s.value: sum(1 for n in self.nodes.values() if n.status == s) for s in NodeStatus}
                            results_dict['max_depth_reached'] = max(n.depth for n in self.nodes.values()) if self.nodes else 0
                            results_dict['search_completed'] = True
                            results_dict['explored_nodes_log'] = self.explored_nodes_log # Add the full log
                            return self.successful_paths.copy(), results_dict
                
                # If stop_on_first_success and a path was just found, break outer 'for node in nodes_to_process' loop
                if self.stop_on_first_success and self.successful_paths:
                    break
            
            # If stop_on_first_success and a path was found in this depth, break main 'while' loop
            if self.stop_on_first_success and self.successful_paths:
                break
            
            # Prepare for next depth
            nodes_to_process = [n for n in next_nodes if not n.is_terminal()]
            current_depth += 1
        
        # Generate results (if not already returned due to stop_on_first_success)
        search_time = time.time() - start_time
        
        # Count nodes by status
        status_counts = {}
        max_depth_reached = 0
        
        for node in self.nodes.values():
            status = node.status.value
            status_counts[status] = status_counts.get(status, 0) + 1
            max_depth_reached = max(max_depth_reached, node.depth)
        
        results_dict.update({
            'successful_paths': self.successful_paths.copy(),
            'total_nodes': len(self.nodes),
            'search_time_seconds': search_time,
            'nodes_by_status': status_counts,
            'max_depth_reached': max_depth_reached,
            'search_completed': True,
            'explored_nodes_log': self.explored_nodes_log # Add the full log
        })
        
        print(f"      📈 Search complete: {len(self.successful_paths)} paths, {len(self.nodes)} nodes, {search_time:.2f}s")
        
        return self.successful_paths.copy(), results_dict
    
    def _expand_node(self, node: SearchNode, hole_id: str, pickle_info: HolePickleInfo, loader_func, root_node: SearchNode) -> List[SearchNode]:
        """Expand a node by trying all available tactics"""
        
        if node.depth >= self.max_depth:
            return []
        
        children = []
        
        for tactic in self.available_tactics:
            child_sequence = node.tactic_sequence + [tactic]
            child_id = f"{hole_id}_{'_'.join(child_sequence)}"
            
            if child_id in self.nodes:
                continue

            # Check for restart BEFORE trying this tactic
            self._check_and_restart_server(pickle_info, loader_func, root_node)

            # After a potential restart, the parent 'node' we are expanding from might be stale.
            # We MUST re-validate it before using its proof state.
            self._ensure_node_state_is_valid(node)

            child_node = SearchNode(
                node_id=child_id,
                tactic_sequence=child_sequence,
                parent_id=node.node_id,
                depth=node.depth + 1
            )
            
            # Execute just the new tactic on the parent's state
            self._execute_single_tactic(child_node, node.proof_state_id)
            
            self.nodes[child_id] = child_node
            node.children.add(child_id)
            children.append(child_node)
            
            self.explored_nodes_log.append({
                'node_id': child_node.node_id,
                'tactic_sequence': child_node.tactic_sequence,
                'depth': child_node.depth,
                'status': child_node.status.value
            }) # Collect data for logging

            # If we just found a success and we are stopping on first success, break early.
            if child_node.status == NodeStatus.SUCCESS and self.stop_on_first_success:
                print(f"         🛑 _expand_node stopping early: {child_node.node_id} is SUCCESS.")
                break # Break out of the inner loop (for tactic in self.available_tactics)
        
        return children
    
    def _execute_single_tactic(self, node: SearchNode, parent_proof_state_id: int):
        """Executes the last tactic of a node's sequence and updates the node."""
        if not self.lean_integrator or not self.lean_integrator.lean_server:
            node.status = NodeStatus.ERROR
            node.error_message = "No Lean server available"
            return

        tactic_to_execute = node.get_last_tactic()
        if not tactic_to_execute:
            node.status = NodeStatus.ERROR
            node.error_message = "Node has no tactic to execute."
            return
            
        try:
            from lean_interact import ProofStep
            response = self.lean_integrator.lean_server.run(ProofStep(
                proof_state=parent_proof_state_id,
                tactic=tactic_to_execute
            ))

            from lean_interact.interface import LeanError
            if isinstance(response, LeanError):
                node.status = NodeStatus.ERROR
                node.error_message = str(response.message)
            elif hasattr(response, 'goals') and hasattr(response, 'proof_state'):
                if len(response.goals) == 0:
                    node.status = NodeStatus.SUCCESS
                    node.proof_state_id = None # No need for proof state after success
                    node.remaining_goals = 0
                else:
                    node.status = NodeStatus.INCOMPLETE
                    node.proof_state_id = response.proof_state
                    node.remaining_goals = len(response.goals)
            else:
                node.status = NodeStatus.ERROR
                node.error_message = "Invalid response from Lean server"

        except Exception as e:
            node.status = NodeStatus.ERROR
            node.error_message = f"Execution failed: {str(e)}"
        
        # CRITICAL: Update the node's generation to the current server generation
        node.server_generation = self.lean_server_generation

    def _execute_tactic_sequence(self, node: SearchNode, base_proof_state_id: int):
        """
        DEPRECATED but kept for reference.
        Executes a full tactic sequence. Inefficient for expansion.
        """
        if not self.lean_integrator or not self.lean_integrator.lean_server:
            node.status = NodeStatus.ERROR
            node.error_message = "No Lean server available"
            return
        
        try:
            # For executing a sequence, we must start from the root proof state
            # and apply each tactic sequentially.
            current_proof_state_id = base_proof_state_id
            
            for i in range(len(node.tactic_sequence)):
                tactic = node.tactic_sequence[i]
                
                # Execute single tactic on current proof state
                try:
                    response = self.lean_integrator.lean_server.run(ProofStep(
                        proof_state=current_proof_state_id,
                        tactic=tactic
                    ))
                    
                    # Check response
                    if hasattr(response, 'error') and response.error:
                        node.status = NodeStatus.ERROR
                        node.error_message = str(response.error)
                        return
                    
                    # Check if goals are solved
                    if hasattr(response, 'goals'):
                        if len(response.goals) == 0:
                            # All goals solved - success!
                            node.status = NodeStatus.SUCCESS
                            node.remaining_goals = 0
                            if hasattr(response, 'proof_state'):
                                node.proof_state_id = response.proof_state
                            # If this is the last tactic, we are done with the node.
                            # If not, it means an intermediate tactic solved the goal, which is also a success for the sequence.
                            return 
                        else:
                            # Still have goals, continue to next tactic in the sequence
                            node.remaining_goals = len(response.goals)
                            if hasattr(response, 'proof_state'):
                                current_proof_state_id = response.proof_state
                                # Don't set the node's proof_state_id until the full sequence is run
                            else:
                                # If there's no next proof state, the sequence is broken
                                node.status = NodeStatus.ERROR
                                node.error_message = "No proof_state in response to continue sequence."
                                return
                    else:
                        node.status = NodeStatus.ERROR
                        node.error_message = "No goals information in response"
                        return
                        
                except Exception as tactic_error:
                    node.status = NodeStatus.ERROR
                    node.error_message = f"Tactic '{tactic}' failed: {str(tactic_error)}"
                    return

            # If we get here, the full sequence executed but goals remain
            node.status = NodeStatus.INCOMPLETE
            node.proof_state_id = current_proof_state_id # Final state after full sequence
            
        except Exception as e:
            node.status = NodeStatus.ERROR
            node.error_message = f"Execution failed: {str(e)}"


def demo_clean_searcher():
    """Demo the clean searcher"""
    print("🔍 Clean N-gram Searcher Demo")
    print("=" * 40)
    
    searcher = CleanNgramSearcher(max_depth=2, stop_on_first_success=True)
    
    print("✅ Clean searcher initialized")
    print(f"   Max depth: {searcher.max_depth}")
    print(f"   Stop on first success: {searcher.stop_on_first_success}")
    print(f"   Available tactics: {len(searcher.available_tactics)}")
    print(f"   Terminal tactics: {searcher.terminal_tactics}")
    
    print(f"\n💡 Usage:")
    print(f"   searcher.lean_integrator = integrator")
    print(f"   paths, results = searcher.search_hole('hole_1', 42)")


if __name__ == "__main__":
    demo_clean_searcher()