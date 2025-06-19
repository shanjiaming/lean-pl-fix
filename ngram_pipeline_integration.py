#!/usr/bin/env python3
"""
N-gram Pipeline Integration

Provides seamless integration between the new n-gram tactic search system
and the existing minimal verification pipeline. Maintains API compatibility
while providing enhanced search capabilities.

Key Features:
- Drop-in replacement for existing unigram enumeration
- Backward compatibility with existing output formats
- Progressive enhancement (fallback to unigram if needed)
- Memory management and checkpoint support
- Detailed result tracking and analysis
"""

import os
import json
import time
from typing import Dict, List, Optional, Tuple, Any
from datetime import datetime

from ngram_tactic_searcher import NgramTacticSearcher
from ngram_memory_manager import MemoryManager, CheckpointManager
from proofstep_lean_integration import MinimalLeanProofStepIntegrator, ProofState
from unified_problem_manager import problem_manager


class NgramPipelineIntegrator:
    """
    Main integration class that bridges n-gram search with existing pipeline
    """
    
    def __init__(self, 
                 max_depth: int = 2,
                 enable_checkpoints: bool = True,
                 enable_memory_management: bool = True,
                 fallback_to_unigram: bool = True):
        
        self.max_depth = max_depth
        self.enable_checkpoints = enable_checkpoints
        self.enable_memory_management = enable_memory_management
        self.fallback_to_unigram = fallback_to_unigram
        
        # Initialize components
        self.searcher: Optional[NgramTacticSearcher] = None
        self.memory_manager: Optional[MemoryManager] = None
        self.checkpoint_manager: Optional[CheckpointManager] = None
        
        # Statistics
        self.integration_stats = {
            'holes_processed': 0,
            'ngram_successes': 0,
            'unigram_fallbacks': 0,
            'errors': 0,
            'total_processing_time': 0.0
        }
    
    def initialize_components(self) -> None:
        """Initialize all components"""
        if not self.searcher:
            self.searcher = NgramTacticSearcher(max_depth=self.max_depth)
        
        if self.enable_memory_management and not self.memory_manager:
            self.memory_manager = MemoryManager(
                max_nodes_before_restart=500,  # Conservative limit
                max_memory_mb=2048,
                max_runtime_hours=1.0
            )
        
        if self.enable_checkpoints and not self.checkpoint_manager:
            self.checkpoint_manager = CheckpointManager()
    
    def enumerate_ngram_tactics_with_proof_states(self,
                                                header_content: str,
                                                clear_version: str,
                                                enumerable_indices: List[int],
                                                sorry_map: Dict[int, 'SorryInfo'],
                                                problem_id: str = None) -> Dict:
        """
        N-gram version of enumerate_tactics_with_proof_states
        
        This is the main integration point that replaces the unigram enumeration
        while maintaining full API compatibility.
        
        Args:
            header_content: Lean header content
            clear_version: Clear version with holes
            enumerable_indices: List of enumerable sorry indices
            sorry_map: Mapping of sorry indices to SorryInfo
            problem_id: Problem ID for checkpoint management
            
        Returns:
            Dict with results compatible with existing pipeline
        """
        start_time = time.time()
        self.initialize_components()
        
        print(f"\n🚀 Starting N-gram enumeration (max_depth={self.max_depth})")
        print(f"   Enumerable holes: {len(enumerable_indices)}")
        print(f"   Checkpoints: {'enabled' if self.enable_checkpoints else 'disabled'}")
        print(f"   Memory management: {'enabled' if self.enable_memory_management else 'disabled'}")
        
        # Try to resume from checkpoint if available
        resumed_from_checkpoint = False
        if self.enable_checkpoints and problem_id:
            checkpoint_data = self.checkpoint_manager.load_checkpoint(problem_id)
            if checkpoint_data:
                print(f"📂 Resuming from checkpoint for {problem_id}")
                self.searcher = self.checkpoint_manager.restore_searcher_from_checkpoint(checkpoint_data)
                resumed_from_checkpoint = True
        
        # Initialize Lean integrator
        if not self.searcher.lean_integrator:
            self.searcher.initialize_lean_integrator(header_content)
        
        try:
            return self._execute_ngram_enumeration(
                header_content, clear_version, enumerable_indices, 
                sorry_map, problem_id, start_time, resumed_from_checkpoint
            )
        
        except Exception as e:
            print(f"❌ N-gram enumeration failed: {e}")
            
            if self.fallback_to_unigram:
                print(f"🔄 Falling back to unigram enumeration")
                return self._fallback_to_unigram_enumeration(
                    header_content, clear_version, enumerable_indices, sorry_map
                )
            else:
                # Return empty results
                return {
                    'successful_tactics': {},
                    'ngram_attempts': {},
                    'proof_states_extracted': 0,
                    'error': str(e)
                }
        
        finally:
            if self.searcher and self.searcher.lean_integrator:
                self.searcher.shutdown_lean_integrator()
    
    def _execute_ngram_enumeration(self,
                                 header_content: str,
                                 clear_version: str,
                                 enumerable_indices: List[int],
                                 sorry_map: Dict[int, 'SorryInfo'],
                                 problem_id: str,
                                 start_time: float,
                                 resumed_from_checkpoint: bool) -> Dict:
        """Execute the main n-gram enumeration logic"""
        
        # Extract proof states (reuse existing logic from unigram)
        integrator = MinimalLeanProofStepIntegrator()
        integrator.initialize_lean_server()
        
        try:
            server_sorries = integrator.extract_proof_states_from_sorries(header_content, clear_version)
            if not server_sorries:
                return {'successful_tactics': {}, 'ngram_attempts': {}, 'proof_states_extracted': 0}
            
            # Match parser sorries with server sorries (reuse existing logic)
            proof_states = self._match_sorries_to_proof_states(
                server_sorries, sorry_map, enumerable_indices
            )
            
            results = {
                'successful_tactics': {},        # hole_id -> first successful tactic (backward compatibility)
                'ngram_attempts': {},            # hole_id -> complete n-gram search results  
                'proof_states_extracted': len(server_sorries),
                'processing_stats': {
                    'resumed_from_checkpoint': resumed_from_checkpoint,
                    'max_depth': self.max_depth,
                    'memory_management_enabled': self.enable_memory_management,
                    'checkpoint_enabled': self.enable_checkpoints
                }
            }
            
            # Process each enumerable hole
            holes_processed = 0
            for sorry_idx in enumerable_indices:
                if sorry_idx not in proof_states:
                    continue
                
                sorry_info = sorry_map.get(sorry_idx)
                if not sorry_info or not sorry_info.hole_id:
                    continue
                
                hole_id = sorry_info.hole_id
                initial_proof_state_id = proof_states[sorry_idx].context.split('_')[1]
                
                print(f"\n🎯 Processing hole '{hole_id}' (proof_state {initial_proof_state_id})")
                
                # Check if server restart is needed
                if self.enable_memory_management:
                    should_restart, reason = self.memory_manager.should_restart_server(self.searcher)
                    if should_restart:
                        self.memory_manager.restart_server(self.searcher, reason)
                        
                        # Save checkpoint after restart
                        if self.enable_checkpoints and problem_id:
                            self.checkpoint_manager.save_checkpoint(problem_id, self.searcher, self.memory_manager)
                
                # Perform n-gram search for this hole
                try:
                    successful_paths, hole_results = self.searcher.search_hole(
                        hole_id, int(initial_proof_state_id)
                    )
                    
                    # Store complete n-gram results
                    results['ngram_attempts'][hole_id] = hole_results
                    
                    # Extract first successful tactic for backward compatibility
                    if successful_paths:
                        first_path = successful_paths[0]
                        if first_path:
                            # Store the full path as a single "tactic" for now
                            # In the future, the downstream synthesis can handle sequences
                            if len(first_path) == 1:
                                results['successful_tactics'][hole_id] = first_path[0]
                            else:
                                # For multi-tactic sequences, create a compound tactic
                                results['successful_tactics'][hole_id] = ' ; '.join(first_path)
                        
                        self.integration_stats['ngram_successes'] += 1
                    
                    holes_processed += 1
                    self.integration_stats['holes_processed'] += 1
                    
                    # Periodic checkpoint
                    if (self.enable_checkpoints and problem_id and 
                        holes_processed % 5 == 0):
                        self.checkpoint_manager.save_checkpoint(problem_id, self.searcher, self.memory_manager)
                
                except Exception as e:
                    print(f"❌ Error processing hole '{hole_id}': {e}")
                    self.integration_stats['errors'] += 1
                    
                    # Store error result
                    results['ngram_attempts'][hole_id] = {
                        'hole_id': hole_id,
                        'error': str(e),
                        'successful_paths': [],
                        'total_nodes': 0,
                        'search_time_seconds': 0.0
                    }
            
            # Final checkpoint
            if self.enable_checkpoints and problem_id:
                self.checkpoint_manager.save_checkpoint(problem_id, self.searcher, self.memory_manager)
            
            # Add final statistics
            total_time = time.time() - start_time
            self.integration_stats['total_processing_time'] += total_time
            
            results['integration_stats'] = {
                **self.integration_stats,
                'current_session_time': total_time,
                'searcher_stats': self.searcher.get_statistics() if self.searcher else {}
            }
            
            if self.enable_memory_management:
                results['memory_report'] = self.memory_manager.get_memory_report(self.searcher)
            
            print(f"\n📈 N-gram Enumeration Summary:")
            print(f"   Holes processed: {holes_processed}")
            print(f"   N-gram successes: {self.integration_stats['ngram_successes']}")
            print(f"   Total time: {total_time:.2f}s")
            
            if self.searcher:
                searcher_stats = self.searcher.get_statistics()
                print(f"   Cache hit rate: {searcher_stats['cache_hits']/(searcher_stats['cache_hits']+searcher_stats['cache_misses'])*100:.1f}%")
                print(f"   Server restarts: {searcher_stats['server_restarts']}")
            
            return results
        
        finally:
            integrator.shutdown_lean_server()
    
    def _match_sorries_to_proof_states(self,
                                     server_sorries: List,
                                     sorry_map: Dict[int, 'SorryInfo'],
                                     enumerable_indices: List[int]) -> Dict[int, ProofState]:
        """Match parser sorries with server sorries (reuse existing logic)"""
        
        # This reuses the matching logic from the existing pipeline
        # Create a simplified mapping for n-gram usage
        proof_states = {}
        
        # Group parser sorries by line
        parser_sorries_by_line = {}
        for idx, info in sorry_map.items():
            if info.line not in parser_sorries_by_line:
                parser_sorries_by_line[info.line] = []
            parser_sorries_by_line[info.line].append({'col': info.column, 'idx': idx})
        
        # Match server sorries to parser sorries
        for server_sorry in server_sorries:
            server_line = server_sorry.start_pos.line
            server_col = server_sorry.start_pos.column
            
            if server_line in parser_sorries_by_line and parser_sorries_by_line[server_line]:
                candidates = parser_sorries_by_line[server_line]
                best_match = min(candidates, key=lambda c: abs(c['col'] - (server_col - 1)))
                
                if abs(best_match['col'] - (server_col - 1)) < 5:
                    matched_idx = best_match['idx']
                    proof_state_id = server_sorry.proof_state
                    
                    proof_states[matched_idx] = ProofState(
                        sorry_index=matched_idx,
                        goals=[server_sorry.goal],
                        context=f"ProofState_{proof_state_id}",
                        position_info=f"line_{server_line}_col_{server_col}"
                    )
                    
                    parser_sorries_by_line[server_line].remove(best_match)
        
        return proof_states
    
    def _fallback_to_unigram_enumeration(self,
                                       header_content: str,
                                       clear_version: str,
                                       enumerable_indices: List[int],
                                       sorry_map: Dict[int, 'SorryInfo']) -> Dict:
        """Fallback to original unigram enumeration"""
        print(f"🔄 Executing unigram fallback")
        
        self.integration_stats['unigram_fallbacks'] += 1
        
        # Use original unigram implementation
        integrator = MinimalLeanProofStepIntegrator()
        
        try:
            integrator.initialize_lean_server()
            
            unigrams = ["norm_num", "linarith", "nlinarith", "omega", "ring", "ring_nf", 
                       "simp", "simpa", "field_simp", "positivity", "norm_cast"]
            
            results = integrator.enumerate_tactics_with_proof_states(
                header_content, clear_version, unigrams, enumerable_indices, sorry_map
            )
            
            # Add fallback indicator
            results['fallback_used'] = True
            results['fallback_reason'] = 'N-gram enumeration failed'
            
            return results
        
        finally:
            integrator.shutdown_lean_server()


def create_ngram_wrapper_for_existing_pipeline():
    """
    Create wrapper that integrates n-gram search into existing pipeline
    without breaking current functionality
    """
    
    def enumerate_ngram_tactics_with_proof_states(integrator_self, 
                                                header_content: str, 
                                                clear_version: str,
                                                enumerable_indices: List[int],
                                                sorry_map: Dict[int, 'SorryInfo'],
                                                max_depth: int = 2,
                                                problem_id: str = None) -> Dict:
        """
        Enhanced version of enumerate_tactics_with_proof_states with n-gram support
        """
        
        print(f"🔧 Using N-gram tactic enumeration (max_depth={max_depth})")
        
        # Create n-gram integrator
        ngram_integrator = NgramPipelineIntegrator(
            max_depth=max_depth,
            enable_checkpoints=True,
            enable_memory_management=True,
            fallback_to_unigram=True
        )
        
        # Execute n-gram enumeration
        return ngram_integrator.enumerate_ngram_tactics_with_proof_states(
            header_content=header_content,
            clear_version=clear_version,
            enumerable_indices=enumerable_indices,
            sorry_map=sorry_map,
            problem_id=problem_id
        )
    
    # Monkey patch the new method onto the existing integrator class
    MinimalLeanProofStepIntegrator.enumerate_ngram_tactics_with_proof_states = enumerate_ngram_tactics_with_proof_states
    
    print("🔧 N-gram wrapper installed on MinimalLeanProofStepIntegrator")


def demo_ngram_integration():
    """Demonstrate n-gram integration with existing pipeline"""
    print("🔗 N-gram Pipeline Integration Demo")
    print("=" * 60)
    
    # Install the wrapper
    create_ngram_wrapper_for_existing_pipeline()
    
    # Create integrator instance
    integrator = NgramPipelineIntegrator(
        max_depth=2,
        enable_checkpoints=True,
        enable_memory_management=True
    )
    
    print("✅ N-gram integration components initialized")
    print("✅ Wrapper installed on existing pipeline")
    print("✅ Backward compatibility maintained")
    
    # Show integration statistics
    stats = integrator.integration_stats
    print(f"\n📊 Integration Statistics:")
    for key, value in stats.items():
        print(f"   {key}: {value}")
    
    print(f"\n💡 To use in existing pipeline:")
    print(f"   1. Replace 'enumerate_tactics_with_proof_states' calls")
    print(f"   2. Use 'enumerate_ngram_tactics_with_proof_states' instead") 
    print(f"   3. Pass max_depth parameter for n-gram control")
    print(f"   4. Enjoy enhanced tactic sequence discovery!")
    
    print(f"\n🎯 Example usage:")
    print(f"   results = integrator.enumerate_ngram_tactics_with_proof_states(")
    print(f"       header_content, clear_version, enumerable_indices, sorry_map,")
    print(f"       max_depth=2, problem_id='demo_problem')")


if __name__ == "__main__":
    demo_ngram_integration()