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
from typing import Dict, List, Optional, Set, Tuple, Callable
from dataclasses import dataclass, field

import psutil
from proofstep_lean_integration import MinimalLeanProofStepIntegrator
from theorem_sourcing_interface import get_related_theorems
from llm_pruner import LLMPruner, PruningDecision

# Import unified type definitions
from ngram_types import HolePickleInfo


@dataclass(frozen=True)
class ProofStateSignature:
    """Represents a unique signature of a proof state (hypothesis + goal combination)"""
    hypothesis_hash: str
    goal_hash: str
    
    def __hash__(self):
        return hash((self.hypothesis_hash, self.goal_hash))
    
    def __eq__(self, other):
        if not isinstance(other, ProofStateSignature):
            return False
        return (self.hypothesis_hash == other.hypothesis_hash and 
                self.goal_hash == other.goal_hash)


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
    error_message: Optional[str] = None
    remaining_goals: int = 0
    llm_pruned: bool = False  # Track if this node was pruned by LLM
    state_duplicate_pruned: bool = False  # Track if this node was pruned by state duplication
    
    def get_last_tactic(self) -> Optional[str]:
        return self.tactic_sequence[-1] if self.tactic_sequence else None
    
    def is_terminal(self) -> bool:
        """Check if this node should not be expanded further"""
        return (self.status in [NodeStatus.SUCCESS, NodeStatus.ERROR] or
                self.get_last_tactic() in ['linarith', 'nlinarith', 'omega'] or
                self.llm_pruned or
                self.state_duplicate_pruned)


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
    
    def __init__(self, max_depth: int = 2, stop_on_first_success: bool = True, 
                 theorem_query_func: Optional[Callable[[str, str, str], List[str]]] = None,
                 enable_llm_pruning: bool = False):
        self.max_depth = max_depth
        self.stop_on_first_success = stop_on_first_success
        self.enable_llm_pruning = enable_llm_pruning
        
        # Simple tactic list
        self.available_tactics = ["norm_num", "linarith", "nlinarith", "omega", "ring", "ring_nf", "simp", "simpa", "field_simp", "positivity", "norm_cast"]
        
        self.terminal_tactics = {'linarith', 'nlinarith', 'omega'}
        
        # Theorem query function for dynamic rw[theorem] tactics
        # it seems that we use self._default_theorem_query for now
        self.theorem_query_func = theorem_query_func or self._default_theorem_query
        
        # LLM Pruner (initialized only if enabled)
        self.llm_pruner: Optional[LLMPruner] = None
        if self.enable_llm_pruning:
            self.llm_pruner = LLMPruner()
        
        # Current search state
        self.nodes: Dict[str, SearchNode] = {}
        self.successful_paths: List[List[str]] = []
        self.lean_integrator: Optional[MinimalLeanProofStepIntegrator] = None
        
        # State deduplication for current hole (reset for each hole)
        self.visited_states: Set[ProofStateSignature] = set()

        # Detailed search log
        self.explored_nodes_log: List[Dict] = []
    
    # Memory management now handled transparently by ProofStateCache, removed complex server restart logic
    
    def _default_theorem_query(self, dataset: str, problem_id: str, hole_id: str) -> List[str]:
        """Default theorem query function - uses real theorem sourcing interface with fallback"""
        theorems = get_related_theorems(dataset, problem_id, hole_id)
        return theorems
    
    def get_available_tactics_for_hole(self, dataset: str, problem_id: str, hole_id: str) -> List[str]:
        """Get all available tactics for a specific hole, including dynamic rw[theorem] tactics"""
        # Start with base tactics
        tactics = self.available_tactics.copy()
        
        # Add dynamic rw[theorem] tactics
        available_theorems = self.theorem_query_func(dataset, problem_id, hole_id)
        for theorem in available_theorems:
            tactics.append(f"rw[{theorem}]")
        
        return tactics

    def _ensure_node_state_is_valid(self, node: SearchNode):
        """Ensure node state is valid - now handled transparently by ProofStateCache"""
        if node.proof_state_id is None:
            raise RuntimeError(f"Node {node.node_id} has no proof state ID")
        
        # ProofStateCache will automatically handle state availability checking and recovery
        # We only need to ensure the state ID exists
        return

    def search_hole(self, pickle_info: HolePickleInfo, initial_proof_state_id: int, loader_func=None, 
                    dataset: str = "unknown", problem_id: str = "unknown") -> Tuple[List[List[str]], Dict]:
        """Search for solutions to a specific hole"""
        
        print(f"      🔍 Starting n-gram search for {pickle_info.hole_id} (PS_{initial_proof_state_id})")
        start_time = time.time()
        
        # Reset state for this hole
        self.nodes.clear()
        self.successful_paths.clear()
        self.visited_states.clear()  # Reset state deduplication for this hole
        print(f"      🔄 Reset visited states for hole {pickle_info.hole_id}")

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
        
        # Create root node - get initial goal count
        root_id = f"{pickle_info.hole_id}_root"
        initial_goals = 1  # Default assumption for a hole
        
        # Try to get actual goal count from Lean server
        if self.lean_integrator and self.lean_integrator.lean_server:
            try:
                from lean_interact import ProofStateInfo
                state_info = self.lean_integrator.lean_server.run(ProofStateInfo(proof_state=initial_proof_state_id))
                if hasattr(state_info, 'goals'):
                    initial_goals = len(state_info.goals)
                    print(f"         📊 Root node has {initial_goals} goals")
            except Exception as e:
                print(f"         ⚠️  Could not get initial goal count: {e}")
        
        root_node = SearchNode(
            node_id=root_id,
            tactic_sequence=[],
            parent_id=None,
            depth=0,
            proof_state_id=initial_proof_state_id,
            status=NodeStatus.PENDING,
            remaining_goals=initial_goals
        )
        self.nodes[root_id] = root_node
        self.explored_nodes_log.append({
            'node_id': root_node.node_id,
            'tactic_sequence': root_node.tactic_sequence,
            'depth': root_node.depth,
            'status': root_node.status.value
        })
        
        # Record initial state in visited states to avoid revisiting it
        if not self._is_state_visited(initial_proof_state_id):
            print(f"         🔄 Recorded initial state for hole {pickle_info.hole_id}")
        else:
            print(f"         ⚠️  Initial state already visited (unexpected)")
        
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
                # Ensure node state is valid (now handled transparently by cache)
                self._ensure_node_state_is_valid(node)

                # If node is terminal, skip
                if node.is_terminal():
                    continue
                
                children = self._expand_node(node, pickle_info.hole_id, dataset, problem_id)
                next_nodes.extend(children)
                
                # Check for success immediately
                for child in children:
                    if child.status == NodeStatus.SUCCESS:
                        self.successful_paths.append(child.tactic_sequence.copy())
                        print(f"         🎉 Success: {' ; '.join(child.tactic_sequence)}")
                        
                        # If stop_on_first_success, immediately break all loops and return
                        if self.stop_on_first_success:
                            print(f"         🏁 Stopping early (first success found at current depth)")
                            # Populate final stats before returning including LLM and state deduplication stats
                            llm_pruned_count = sum(1 for n in self.nodes.values() if n.llm_pruned)
                            state_duplicate_pruned_count = sum(1 for n in self.nodes.values() if n.state_duplicate_pruned)
                            llm_stats = {}
                            if self.enable_llm_pruning and self.llm_pruner:
                                llm_stats = self.llm_pruner.get_pruning_stats()
                            
                            results_dict['successful_paths'] = self.successful_paths.copy()
                            results_dict['total_nodes'] = len(self.nodes)
                            results_dict['search_time_seconds'] = time.time() - start_time
                            results_dict['nodes_by_status'] = {s.value: sum(1 for n in self.nodes.values() if n.status == s) for s in NodeStatus}
                            results_dict['max_depth_reached'] = max(n.depth for n in self.nodes.values()) if self.nodes else 0
                            results_dict['search_completed'] = True
                            results_dict['explored_nodes_log'] = self.explored_nodes_log
                            results_dict['llm_pruning_enabled'] = self.enable_llm_pruning
                            results_dict['llm_pruned_nodes'] = llm_pruned_count
                            results_dict['llm_pruning_stats'] = llm_stats
                            results_dict['state_deduplication_enabled'] = True
                            results_dict['state_duplicate_pruned_nodes'] = state_duplicate_pruned_count
                            results_dict['total_visited_states'] = len(self.visited_states)
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
        llm_pruned_count = 0
        state_duplicate_pruned_count = 0
        
        for node in self.nodes.values():
            status = node.status.value
            status_counts[status] = status_counts.get(status, 0) + 1
            max_depth_reached = max(max_depth_reached, node.depth)
            if node.llm_pruned:
                llm_pruned_count += 1
            if node.state_duplicate_pruned:
                state_duplicate_pruned_count += 1
        
        # Add LLM pruning statistics
        llm_stats = {}
        if self.enable_llm_pruning and self.llm_pruner:
            llm_stats = self.llm_pruner.get_pruning_stats()
        
        results_dict.update({
            'successful_paths': self.successful_paths.copy(),
            'total_nodes': len(self.nodes),
            'search_time_seconds': search_time,
            'nodes_by_status': status_counts,
            'max_depth_reached': max_depth_reached,
            'search_completed': True,
            'explored_nodes_log': self.explored_nodes_log,
            'llm_pruning_enabled': self.enable_llm_pruning,
            'llm_pruned_nodes': llm_pruned_count,
            'llm_pruning_stats': llm_stats,
            'state_deduplication_enabled': True,
            'state_duplicate_pruned_nodes': state_duplicate_pruned_count,
            'total_visited_states': len(self.visited_states)
        })
        
        print(f"      📈 Search complete: {len(self.successful_paths)} paths, {len(self.nodes)} nodes, {search_time:.2f}s")
        print(f"      🔄 State deduplication: {state_duplicate_pruned_count} nodes pruned, {len(self.visited_states)} unique states")
        
        if self.enable_llm_pruning and llm_pruned_count > 0:
            print(f"      🤖 LLM pruning: {llm_pruned_count} nodes pruned")
            if llm_stats:
                print(f"      🤖 LLM stats: {llm_stats['total_queries']} queries, {llm_stats['prune_rate']:.2%} prune rate")
        
        return self.successful_paths.copy(), results_dict
    
    def _get_proof_state_signature(self, proof_state_id: int) -> Optional[ProofStateSignature]:
        """Extract a signature from a proof state for deduplication"""
        if not self.lean_integrator or not self.lean_integrator.lean_server or proof_state_id is None:
            return None
            
        try:
            # Use ProofStep with skip to get current state information
            from lean_interact import ProofStep
            response = self.lean_integrator.lean_server.run(ProofStep(
                proof_state=proof_state_id,
                tactic="skip"  # No-op tactic to get current state
            ))
            
            # Extract goals and hypotheses information
            if hasattr(response, 'goals') and response.goals:
                # Create a simplified hash of the goals and hypotheses
                goals_str = ""
                for i, goal in enumerate(response.goals[:3]):  # Limit to first 3 goals for performance
                    goal_str = str(goal)
                    # Extract hypothesis and goal parts
                    if "⊢" in goal_str:
                        hypothesis_part, goal_part = goal_str.split("⊢", 1)
                        goals_str += f"G{i}[H:{hash(hypothesis_part.strip())}|G:{hash(goal_part.strip())}]"
                    else:
                        goals_str += f"G{i}[{hash(goal_str)}]"
                
                # Create signature with combined information
                import hashlib
                combined_hash = hashlib.md5(goals_str.encode()).hexdigest()[:16]
                return ProofStateSignature(
                    hypothesis_hash=combined_hash[:8],
                    goal_hash=combined_hash[8:]
                )
            else:
                # No goals means proof is complete
                return ProofStateSignature(hypothesis_hash="complete", goal_hash="complete")
                
        except Exception as e:
            # If we can't get signature, don't block the search
            print(f"         ⚠️  Failed to get proof state signature: {e}")
            return None
    
    def _is_state_visited(self, proof_state_id: int) -> bool:
        """Check if a proof state has been visited before"""
        signature = self._get_proof_state_signature(proof_state_id)
        if signature is None:
            return False  # If we can't get signature, allow the search to continue
        
        if signature in self.visited_states:
            return True
        
        # Add to visited states
        self.visited_states.add(signature)
        return False
    
    def _expand_node(self, node: SearchNode, hole_id: str, dataset: str = "unknown", problem_id: str = "unknown") -> List[SearchNode]:
        """Expand a node by trying all available tactics including dynamic rw[theorem] tactics"""
        
        if node.depth >= self.max_depth:
            return []
        
        children = []
        
        # Get dynamic tactics for this specific hole
        available_tactics = self.get_available_tactics_for_hole(dataset, problem_id, hole_id)
        
        for tactic in available_tactics:
            child_sequence = node.tactic_sequence + [tactic]
            child_id = f"{hole_id}_{'_'.join(child_sequence)}"
            
            if child_id in self.nodes:
                continue

            child_node = SearchNode(
                node_id=child_id,
                tactic_sequence=child_sequence,
                parent_id=node.node_id,
                depth=node.depth + 1
            )
            
            # Execute just the new tactic on the parent's state
            if node.proof_state_id is not None:
                self._execute_single_tactic(child_node, node.proof_state_id)
            else:
                child_node.status = NodeStatus.ERROR
                child_node.error_message = "Parent node has no proof state"
            
            # LLM Pruning: Check if we should prune incomplete nodes (skip if already pruned by state deduplication)
            if (self.enable_llm_pruning and 
                self.llm_pruner and 
                child_node.status == NodeStatus.INCOMPLETE and
                not child_node.state_duplicate_pruned and  # Short circuit: skip LLM if already pruned by state deduplication
                node.proof_state_id is not None):
                
                try:
                    print(f"         🤖 LLM pruning check for {child_node.node_id}...")
                    
                    # Get detailed goal information for better LLM decisions
                    def get_goal_details(proof_state_id):
                        if self.lean_integrator and self.lean_integrator.lean_server and proof_state_id is not None:
                            try:
                                # Execute a dummy tactic to get goal information
                                from lean_interact import ProofStep
                                response = self.lean_integrator.lean_server.run(ProofStep(
                                    proof_state=proof_state_id,
                                    tactic="skip"  # No-op tactic to just get the current state
                                ))
                                
                                if hasattr(response, 'goals'):
                                    goals = response.goals
                                    if goals:
                                        # Truncate each goal for LLM readability
                                        goal_summaries = []
                                        for i, goal in enumerate(goals[:2]):  # Max 2 goals
                                            goal_str = str(goal)
                                            goal_summaries.append(f"Goal {i+1}: {goal_str}")
                                        return f"{len(goals)} goals:\n" + "\n".join(goal_summaries)
                                    else:
                                        return "0 goals (solved)"
                            except Exception as e:
                                # If skip fails, goal might be unsolved, try a safer approach
                                return f"Could not access goal details: {str(e)[:100]}"
                        return "No goal information available"
                    
                    # Prepare detailed state information for LLM
                    pre_goal_details = get_goal_details(node.proof_state_id)
                    post_goal_details = get_goal_details(child_node.proof_state_id)
                    
                    pre_state_info = {
                        "remaining_goals": node.remaining_goals,
                        "goals_summary": f"BEFORE:\n{pre_goal_details}"
                    }
                    
                    post_state_info = {
                        "remaining_goals": child_node.remaining_goals,
                        "goals_summary": f"AFTER '{tactic}':\n{post_goal_details}"
                    }
                    
                    # Get LLM decision
                    decision = self.llm_pruner.should_prune_node(
                        tactic_sequence=child_node.tactic_sequence,
                        pre_state_info=pre_state_info,
                        post_state_info=post_state_info,
                        hole_id=hole_id
                    )
                    
                    if decision.should_prune:
                        print(f"         🤖 LLM PRUNE: {child_node.node_id} - {decision.reasoning}")
                        child_node.llm_pruned = True
                    else:
                        print(f"         🤖 LLM CONTINUE: {child_node.node_id} - {decision.reasoning}")
                        
                except Exception as e:
                    print(f"         ❌ LLM pruning failed for {child_node.node_id}: {e}")
                    # Continue without pruning if LLM fails
            
            self.nodes[child_id] = child_node
            node.children.add(child_id)
            children.append(child_node)
            
            self.explored_nodes_log.append({
                'node_id': child_node.node_id,
                'tactic_sequence': child_node.tactic_sequence,
                'depth': child_node.depth,
                'status': child_node.status.value,
                'llm_pruned': child_node.llm_pruned,
                'state_duplicate_pruned': child_node.state_duplicate_pruned
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
                    
                    # State deduplication check: If this state has been visited before, prune this node
                    if self._is_state_visited(response.proof_state):
                        print(f"         🔄 State deduplication: {node.node_id} leads to visited state, pruning")
                        node.state_duplicate_pruned = True
                        node.status = NodeStatus.INCOMPLETE  # Keep as incomplete but mark as pruned
            else:
                node.status = NodeStatus.ERROR
                node.error_message = "Invalid response from Lean server"

        except Exception as e:
            node.status = NodeStatus.ERROR
            node.error_message = f"Execution failed: {str(e)}"
        
        # State now managed by ProofStateCache, no need to manually track server generation

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
                    from lean_interact import ProofStep
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
    
    # Demo without LLM pruning
    searcher = CleanNgramSearcher(max_depth=2, stop_on_first_success=True, enable_llm_pruning=False)
    
    print("✅ Clean searcher initialized")
    print(f"   Max depth: {searcher.max_depth}")
    print(f"   Stop on first success: {searcher.stop_on_first_success}")
    print(f"   LLM pruning: {searcher.enable_llm_pruning}")
    print(f"   Base tactics: {len(searcher.available_tactics)}")
    print(f"   Terminal tactics: {searcher.terminal_tactics}")
    
    # Demo dynamic tactics
    demo_tactics = searcher.get_available_tactics_for_hole("putnam", "putnam_1986_b6", "hole_4")
    rw_tactics = [t for t in demo_tactics if t.startswith('rw[')]
    print(f"   Dynamic rw[theorem] tactics: {rw_tactics}")
    print(f"   Total tactics with dynamic: {len(demo_tactics)}")
    
    # Demo with LLM pruning
    try:
        searcher_llm = CleanNgramSearcher(max_depth=2, stop_on_first_success=True, enable_llm_pruning=True)
        print(f"\n🤖 LLM-enhanced searcher initialized")
        print(f"   LLM pruning: {searcher_llm.enable_llm_pruning}")
        print(f"   LLM pruner model: {searcher_llm.llm_pruner.model if searcher_llm.llm_pruner else 'N/A'}")
    except Exception as e:
        print(f"\n❌ LLM searcher failed to initialize: {e}")
        print("   Make sure OPENROUTER_API_KEY is set")
    
    print(f"\n💡 Usage:")
    print(f"   searcher = CleanNgramSearcher(enable_llm_pruning=True)")
    print(f"   searcher.lean_integrator = integrator")
    print(f"   paths, results = searcher.search_hole(pickle_info, 42, None, 'dataset', 'problem')")
    
    print(f"\n🎯 Key Features:")
    print(f"   - Dynamic rw[theorem] tactic generation")
    print(f"   - Context-aware theorem selection")
    print(f"   - LLM-based intelligent pruning")
    print(f"   - Complete state isolation between holes")
    print(f"   - Automatic cleanup after each hole")
    print(f"   - Pure pickle-based approach")


if __name__ == "__main__":
    demo_clean_searcher()