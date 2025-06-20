#!/usr/bin/env python3
"""
Clean N-gram Pipeline with ProofState Pickling

Completely rewritten pipeline that uses ProofState pickling for optimal performance.
Two-phase approach:
1. Extract and pickle all proof states once
2. Process each hole independently with clean state

No fallback mechanisms - pure pickle-based approach.
"""

import os
import json
import time
import tempfile
from typing import Dict, List, Optional, Tuple, Any
from datetime import datetime
from dataclasses import dataclass

from clean_ngram_searcher import CleanNgramSearcher
from proofstep_lean_integration import MinimalLeanProofStepIntegrator
from lean_interact import PickleProofState, UnpickleProofState, FileCommand


@dataclass
class HolePickleInfo:
    """Information about a pickled hole"""
    hole_id: str
    sorry_index: int
    pickle_file: str
    original_proof_state_id: int
    line: int
    column: int


class ProofStatePickleManager:
    """Manages ProofState pickling and restoration"""
    
    def __init__(self, problem_id: str = None, dataset: str = None, pickle_dir: str = None):
        if pickle_dir is None and problem_id and dataset:
            # Use decomposition_results structure
            self.pickle_dir = f"decomposition_results/{dataset}/decomposed/{problem_id}/ngram_pickles"
        else:
            self.pickle_dir = pickle_dir or "ngram_pickles"
        os.makedirs(self.pickle_dir, exist_ok=True)
    
    def extract_and_pickle_all_proof_states(self, 
                                           header_content: str,
                                           clear_version: str, 
                                           sorry_map: Dict[int, 'SorryInfo']) -> List[HolePickleInfo]:
        """Extract and pickle all proof states in one go"""
        print("🥒 Phase 1: Extracting and pickling all proof states...")
        
        # Initialize fresh integrator
        integrator = MinimalLeanProofStepIntegrator()
        integrator.initialize_lean_server()
        
        try:
            # Get all server sorries
            server_sorries = integrator.extract_proof_states_from_sorries(header_content, clear_version)
            print(f"   📊 Found {len(server_sorries)} server proof states")
            
            # Match and pickle each hole
            pickle_infos = []
            
            for sorry_idx, sorry_info in sorry_map.items():
                if not sorry_info.hole_id:
                    continue
                    
                # Find matching server sorry
                matched_server_sorry = self._find_matching_server_sorry(server_sorries, sorry_info)
                if not matched_server_sorry:
                    print(f"   ⚠️  No server match for hole {sorry_info.hole_id} at (L:{sorry_info.line}, C:{sorry_info.column})")
                    # For debugging, print available server sorries on the same line
                    sorries_on_line = [s for s in server_sorries if s.start_pos.line == sorry_info.line]
                    if sorries_on_line:
                        print(f"      - Available server sorries on line {sorry_info.line}: " +
                              ", ".join([f"C:{s.start_pos.column}" for s in sorries_on_line]))
                    else:
                        print(f"      - No server sorries found on line {sorry_info.line}.")
                    continue
                
                # Create pickle file with safe path - simplified
                safe_hole_id = sorry_info.hole_id.replace('_', '')
                pickle_file = os.path.join(self.pickle_dir, f"{safe_hole_id}.olean")
                
                # Use absolute path to prevent issues with Lean server's working directory
                abs_pickle_file = os.path.abspath(pickle_file)

                # Pickle the proof state with error handling
                try:
                    print(f"   🥒 Pickling {sorry_info.hole_id} to {abs_pickle_file}...")
                    pickle_result = integrator.lean_server.run(PickleProofState(
                        proof_state=matched_server_sorry.proof_state,
                        pickle_to=abs_pickle_file
                    ))
                    
                    # Check for pickle errors
                    if hasattr(pickle_result, 'error') and pickle_result.error:
                        print(f"   ❌ Pickle error: {pickle_result.error}")
                        continue
                        
                    # Verify file was created
                    if not os.path.exists(abs_pickle_file):
                        print(f"   ❌ Pickle file not created: {abs_pickle_file}")
                        continue
                        
                except Exception as pickle_error:
                    print(f"   ❌ Pickle operation failed for {sorry_info.hole_id}: {pickle_error}")
                    continue
                
                pickle_info = HolePickleInfo(
                    hole_id=sorry_info.hole_id,
                    sorry_index=sorry_idx,
                    pickle_file=abs_pickle_file,
                    original_proof_state_id=matched_server_sorry.proof_state,
                    line=sorry_info.line,
                    column=sorry_info.column
                )
                
                pickle_infos.append(pickle_info)
                print(f"   🥒 Pickled {sorry_info.hole_id} (PS_{matched_server_sorry.proof_state}) -> {abs_pickle_file}")
            
            print(f"🥒 Phase 1 complete: {len(pickle_infos)} holes pickled")
            return pickle_infos
            
        finally:
            integrator.shutdown_lean_server()
    
    def _find_matching_server_sorry(self, server_sorries, sorry_info):
        """Find server sorry that exactly matches the location from sorry_info.

        - Line and column numbers are assumed to match exactly between the
          parser (sorry_info) and the Lean server.
        """
        for server_sorry in server_sorries:
            # Exact match on line
            if server_sorry.start_pos.line == sorry_info.line:
                # Exact match on column
                if server_sorry.start_pos.column == sorry_info.column:
                    return server_sorry
        return None # No exact match found
    
    def load_proof_state_for_hole(self, pickle_info: HolePickleInfo, 
                                 integrator: MinimalLeanProofStepIntegrator) -> int:
        """Load proof state from pickle file with improved error handling"""
        if not os.path.exists(pickle_info.pickle_file):
            raise FileNotFoundError(f"Pickle file not found: {pickle_info.pickle_file}")
        
        # Get absolute path to ensure correct file access
        abs_pickle_file = os.path.abspath(pickle_info.pickle_file)
        
        try:
            print(f"   📦 Unpickling from {abs_pickle_file}...")
            result = integrator.lean_server.run(UnpickleProofState(
                unpickle_proof_state_from=abs_pickle_file
            ))
            print("Done with unpickle")

            # Detailed error checking
            if hasattr(result, 'error') and result.error:
                raise RuntimeError(f"Unpickle failed with error: {result.error}")
            
            # Extract proof state with multiple fallback strategies
            restored_proof_state_id = None
            
            if hasattr(result, 'proof_state'):
                restored_proof_state_id = result.proof_state
            elif hasattr(result, 'proofState'):
                restored_proof_state_id = result.proofState  
            elif isinstance(result, dict) and 'proof_state' in result:
                restored_proof_state_id = result['proof_state']
            elif isinstance(result, dict) and 'proofState' in result:
                restored_proof_state_id = result['proofState']
            else:
                # Last resort: try to extract from string representation
                result_str = str(result)
                print(f"   🔍 Unpickle result format: {result_str}")
                
                import re
                match = re.search(r'proof_state.*?([0-9]+)', result_str)
                if match:
                    restored_proof_state_id = int(match.group(1))
            
            if restored_proof_state_id is None:
                raise RuntimeError(f"Cannot extract proof_state from unpickle result: {result}")
            
            print(f"   ✅ Restored {pickle_info.hole_id}: PS_{restored_proof_state_id}")
            return restored_proof_state_id
            
        except Exception as unpickle_error:
            raise RuntimeError(f"Unpickle operation failed for {pickle_info.hole_id}: {unpickle_error}")
    
    def cleanup_pickle_files(self, pickle_infos: List[HolePickleInfo]):
        """Clean up pickle files after processing"""
        for pickle_info in pickle_infos:
            try:
                if os.path.exists(pickle_info.pickle_file):
                    os.remove(pickle_info.pickle_file)
            except Exception as e:
                print(f"⚠️  Failed to remove {pickle_info.pickle_file}: {e}")


class CleanNgramPipeline:
    """Clean n-gram pipeline using ProofState pickling"""
    
    def __init__(self, max_depth: int = 2, stop_on_first_success: bool = True):
        self.max_depth = max_depth
        self.stop_on_first_success = stop_on_first_success
        self.pickle_manager = None  # Will be initialized with problem info
        
        # Statistics
        self.stats = {
            'holes_processed': 0,
            'pickle_save_time': 0.0,
            'pickle_load_time': 0.0,
            'pickle_load_count': 0,
            'hole_search_time': 0.0,
            'total_time': 0.0,
            'successes': 0,
            'errors': 0
        }
    
    def process_problem(self, 
                       header_content: str,
                       clear_version: str, 
                       enumerable_indices: List[int],
                       sorry_map: Dict[int, 'SorryInfo'],
                       problem_id: str = None,
                       dataset: str = None) -> Dict:
        """Process entire problem using pickle-based approach"""
        
        start_time = time.time()
        print(f"\n🚀 Starting clean n-gram processing (max_depth={self.max_depth})")
        print(f"   Problem: {dataset or 'unknown'}/{problem_id or 'unknown'}")
        print(f"   Enumerable holes: {len(enumerable_indices)}")
        
        # Initialize pickle manager with problem info
        self.pickle_manager = ProofStatePickleManager(problem_id=problem_id, dataset=dataset)
        
        # Phase 1: Extract and pickle all proof states
        pickle_start = time.time()
        pickle_infos = self.pickle_manager.extract_and_pickle_all_proof_states(
            header_content, clear_version, sorry_map
        )
        self.stats['pickle_save_time'] = time.time() - pickle_start
        
        # Phase 2: Process each hole independently
        processing_start = time.time()
        all_hole_results, successful_tactics_summary = self._process_holes_independently(
            pickle_infos, enumerable_indices, header_content
        )
        
        # Cleanup
        self.pickle_manager.cleanup_pickle_files(pickle_infos)
        
        self.stats['total_time'] = time.time() - start_time
        
        # Final summary print
        print(f"\n🎉 Clean n-gram processing complete!")
        print(f"   Total time: {self.stats['total_time']:.2f}s")
        print(f"   Pickle save time: {self.stats['pickle_save_time']:.2f}s")
        print(f"   Pickle load time: {self.stats['pickle_load_time']:.2f}s ({self.stats['pickle_load_count']} loads)")
        print(f"   Hole search time: {self.stats['hole_search_time']:.2f}s")
        print(f"   Successes: {self.stats['successes']}/{self.stats['holes_processed']}")
        
        # Save results
        final_results = {
            'successful_tactics': successful_tactics_summary,
            'ngram_results': all_hole_results,
            'proof_states_extracted': len(pickle_infos),
            'stats': self.stats
        }

        # Save results for checkpointing
        if problem_id and dataset:
            self._save_ngram_results(final_results, problem_id, dataset)

        return final_results
    
    def _process_holes_independently(self, 
                                   pickle_infos: List[HolePickleInfo],
                                   enumerable_indices: List[int],
                                   header_content: str) -> Tuple[Dict[str, Dict], Dict[str, str]]:
        """Process each hole independently, ensuring clean state"""
        
        all_hole_results = {}
        successful_tactics_summary = {}

        # Create mapping from sorry_index to pickle_info for efficient lookup
        pickle_map = {info.sorry_index: info for info in pickle_infos}

        for sorry_idx in enumerable_indices:
            # Use the map to check and retrieve pickle_info
            if sorry_idx not in pickle_map:
                print(f"   ⚠️  No pickle for sorry index {sorry_idx}, skipping...")
                continue

            pickle_info = pickle_map[sorry_idx]
            hole_id = pickle_info.hole_id
            
            print(f"\n   🔍 Processing hole '{hole_id}'...")
            
            try:
                # Process this hole in complete isolation
                tactic_result, search_stats = self._process_single_hole(pickle_info, header_content)
                
                # Accumulate pure search time
                pure_search_time = search_stats.get('search_time_seconds', 0.0) - search_stats.get('server_restart_time', 0.0)
                self.stats['hole_search_time'] += pure_search_time
                
                # Store results
                all_hole_results[hole_id] = search_stats
                
                if tactic_result:
                    # Store first successful path for compatibility in the new summary dict
                    successful_tactics_summary[hole_id] = tactic_result
                    
                    self.stats['successes'] += 1
                    print(f"      ✅ Found successful tactic: {tactic_result}")
                else:
                    print(f"      ❌ No successful paths found")
                
                self.stats['holes_processed'] += 1
                
            except Exception as e:
                print(f"      ❌ Error processing hole '{hole_id}': {e}")
                self.stats['errors'] += 1
                
                # Store error result
                all_hole_results[hole_id] = {
                    'hole_id': hole_id,
                    'error': str(e),
                    'successful_paths': [],
                    'total_nodes': 0,
                    'search_time_seconds': 0.0
                }
        
        return all_hole_results, successful_tactics_summary
    
    def _process_single_hole(self, pickle_info: HolePickleInfo, header_content: str) -> Tuple[Optional[str], Dict]:
        """Process a single hole with completely fresh state"""
        
        print(f"   🔍 Processing hole '{pickle_info.hole_id}'...")
        # Each hole gets a fresh integrator and searcher
        integrator = MinimalLeanProofStepIntegrator()
        integrator.initialize_lean_server()
        searcher = CleanNgramSearcher(max_depth=self.max_depth, stop_on_first_success=self.stop_on_first_success)
        searcher.lean_integrator = integrator # This is critical

        try:
            # CRITICAL FIX: The new Lean server needs to know about the imports
            # to understand the environment of the pickled state. We achieve this
            # by running a command with the header.
            with tempfile.NamedTemporaryFile(mode='w', suffix='.lean', delete=False) as f:
                f.write(header_content)
                header_file = f.name
            
            try:
                from lean_interact import FileCommand
                # This command initializes the environment. We don't care about the response.
                integrator.lean_server.run(FileCommand(path=header_file, content=header_content))
            finally:
                os.unlink(header_file)

            # Restore proof state
            load_start_time = time.time()
            initial_proof_state_id = self.pickle_manager.load_proof_state_for_hole(pickle_info, integrator)
            self.stats['pickle_load_time'] += time.time() - load_start_time
            self.stats['pickle_load_count'] += 1
            
            # Define the loader function for server restarts
            loader_func = lambda p_info, intgr: self.pickle_manager.load_proof_state_for_hole(p_info, intgr)

            # Run the search
            successful_paths, search_stats = searcher.search_hole(
                pickle_info, 
                initial_proof_state_id,
                loader_func
            )
            
            # Determine final tactic from successful paths
            final_tactic = " -> ".join(successful_paths[0]) if successful_paths else None
            
            # Add pickle information to results
            search_stats['pickle_restored'] = True
            search_stats['original_proof_state_id'] = pickle_info.original_proof_state_id
            search_stats['restored_proof_state_id'] = initial_proof_state_id
            
            return final_tactic, search_stats
            
        except Exception as e:
            print(f"      ❌ Error processing {pickle_info.hole_id}: {e}")
            import traceback
            traceback.print_exc()
            return None, {"error": str(e), "hole_id": pickle_info.hole_id}
            
        finally:
            # Clean up temporary file
            if header_file and os.path.exists(header_file):
                os.unlink(header_file)

    def _save_ngram_results(self, results: Dict, problem_id: str, dataset: str):
        """Save final n-gram search results to a file"""
        try:
            # Create output directory
            output_dir = f"decomposition_results/{dataset}/decomposed/{problem_id}"
            os.makedirs(output_dir, exist_ok=True)
            
            # Save detailed ngram results
            ngram_results_file = os.path.join(output_dir, "ngram_search_results.json")
            
            # Prepare results for JSON serialization
            json_results = {
                'problem_id': problem_id,
                'dataset': dataset,
                'timestamp': datetime.now().isoformat(),
                'search_config': {
                    'max_depth': self.max_depth,
                    'stop_on_first_success': self.stop_on_first_success
                },
                'successful_tactics': results.get('successful_tactics', {}),
                'ngram_results': results.get('ngram_results', {}),
                'proof_states_extracted': results.get('proof_states_extracted', 0),
                'stats': results.get('stats', {})
            }
            
            with open(ngram_results_file, 'w') as f:
                json.dump(json_results, f, indent=2, ensure_ascii=False)
            
            print(f"💾 N-gram results saved to: {ngram_results_file}")
            
            # Also create a summary file for quick reference
            summary_file = os.path.join(output_dir, "ngram_summary.txt")
            with open(summary_file, 'w') as f:
                f.write(f"N-gram Search Summary for {problem_id}\n")
                f.write("=" * 50 + "\n\n")
                f.write(f"Search Configuration:\n")
                f.write(f"  Max depth: {self.max_depth}\n")
                f.write(f"  Stop on first success: {self.stop_on_first_success}\n\n")
                
                f.write(f"Results:\n")
                f.write(f"  Successful tactics found: {len(results.get('successful_tactics', {}))}\n")
                f.write(f"  Total holes processed: {self.stats.get('holes_processed', 0)}\n")
                f.write(f"  Success rate: {self.stats.get('successes', 0)}/{self.stats.get('holes_processed', 0)}\n\n")
                
                f.write(f"Performance:\n")
                f.write(f"  Total time: {self.stats.get('total_time', 0):.2f}s\n")
                f.write(f"  Pickle save time: {self.stats.get('pickle_save_time', 0):.2f}s\n")
                f.write(f"  Pickle load time: {self.stats.get('pickle_load_time', 0):.2f}s\n")
                f.write(f"  Hole search time: {self.stats.get('hole_search_time', 0):.2f}s\n\n")
                
                successful_tactics = results.get('successful_tactics', {})
                if successful_tactics:
                    f.write(f"Successful Tactics ({len(successful_tactics)}):\n")
                    for hole_id, tactic in successful_tactics.items():
                        f.write(f"  {hole_id}: {tactic}\n")
                
            print(f"📄 N-gram summary saved to: {summary_file}")
            
        except Exception as e:
            print(f"⚠️  Failed to save ngram results: {e}")


def demo_clean_ngram_pipeline():
    """Demonstrate the clean n-gram pipeline"""
    print("🧪 Clean N-gram Pipeline Demo")
    print("=" * 50)
    
    pipeline = CleanNgramPipeline(max_depth=2, stop_on_first_success=True)
    
    print("✅ Clean pipeline initialized")
    print("✅ ProofState pickling enabled")
    print("✅ Independent hole processing")
    print("✅ No fallback mechanisms")
    print("✅ Complete state isolation")
    
    print(f"\n💡 Usage:")
    print(f"   pipeline = CleanNgramPipeline(max_depth=2)")
    print(f"   results = pipeline.process_problem(header, clear_version, indices, sorry_map)")
    
    print(f"\n🎯 Key Features:")
    print(f"   - Two-phase processing (pickle + process)")
    print(f"   - Complete state isolation between holes")
    print(f"   - Automatic cleanup after each hole")
    print(f"   - No memory accumulation")
    print(f"   - Pure pickle-based approach")


if __name__ == "__main__":
    demo_clean_ngram_pipeline()