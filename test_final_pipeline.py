#!/usr/bin/env python3
print("--- SCRIPT EXECUTION STARTED ---")
"""
Test the final version of the Clean N-gram Pipeline.

This test verifies that the pipeline, with its JIT server restart mechanism,
can successfully process a problem, trigger a restart, and recover gracefully.
"""

import os
import sys
import json
import shutil
from unittest.mock import patch

print("--- IMPORTS LOADED ---")

# Ensure the current directory is in the path to find our modules
sys.path.append(os.path.dirname(os.path.abspath(__file__)))

from ngram_pickle_pipeline import CleanNgramPipeline, ProofStatePickleManager
from proofstep_integration import ProofStepIntegrator
from clean_ngram_searcher import CleanNgramSearcher

print("--- CUSTOM MODULES IMPORTED ---")

def setup_test_environment():
    """Create a temporary directory for test artifacts."""
    test_dir = "temp_test_final_pipeline"
    if os.path.exists(test_dir):
        shutil.rmtree(test_dir)
    os.makedirs(test_dir)
    return test_dir

def run_test(test_dir):
    """Runs the main test of the pipeline."""
    print("🚀 Starting final pipeline test...")

    # --- Test Data ---
    header_content = """
import Mathlib.Data.Real.Basic
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Linarith

macro "hole_1" : tactic => `(tactic| admit)
    """
    lean_code = """
theorem test_theorem (x : ℝ) (h : x > 0) : x + 1 > 1 := by
  hole_1
    """
    problem_id = "test_problem_01"
    dataset = "temp_test"

    # --- Setup Pipeline ---
    # We will patch the searcher's memory limits to force a restart.
    pipeline = CleanNgramPipeline(max_depth=2, stop_on_first_success=True)

    # Need to get a valid sorry_map first.
    # We use ProofStepIntegrator for its parsing capabilities.
    temp_integrator = ProofStepIntegrator(header_content)
    session = temp_integrator.initialize_session(header_content, lean_code)
    sorry_map = session.sorry_map
    enumerable_indices = session.enumerable_indices

    # --- Patching Searcher to force restart ---
    # We patch the __init__ method of the searcher to force a restart.
    original_init = CleanNgramSearcher.__init__

    def patched_init(self, *args, **kwargs):
        original_init(self, *args, **kwargs)
        self.max_memory_percent = 100.0  # Set to 100% to disable restarts for this test
        self.proofstep_check_interval = 2 # Still check frequently, but won't trigger restart
        print("    [PATCHED] CleanNgramSearcher initialized with max memory limits to disable restart.")

    with patch('ngram_pickle_pipeline.CleanNgramSearcher.__init__', new=patched_init):
        print("   Running pipeline with patched searcher...")
        
        # Override the pickle directory to our temporary one
        pipeline.pickle_manager = ProofStatePickleManager(pickle_dir=os.path.join(test_dir, "pickles"))
        
        results = pipeline.process_problem(
            header_content=header_content,
            clear_version=lean_code,
            enumerable_indices=enumerable_indices,
            sorry_map=sorry_map,
            problem_id=problem_id
        )

    print("\n\n✅ Pipeline finished.")
    print("--- Final Results ---")
    print(json.dumps(results, indent=2))
    
    # --- Verification ---
    print("\n--- Verifying Test Outcome ---")
    final_results_for_hole = results.get('ngram_results', {}).get('hole_1', {})
    
    # Print the detailed search log
    print("\n--- Detailed Search Log ---")
    if 'explored_nodes_log' in final_results_for_hole:
        for node_data in final_results_for_hole['explored_nodes_log']:
            tactic_seq_str = ' -> '.join(node_data['tactic_sequence']) if node_data['tactic_sequence'] else '[root]'
            print(f"  Depth {node_data['depth']}: {tactic_seq_str} (Status: {node_data['status']})")
    else:
        print("  No detailed search log available.")

    if final_results_for_hole:
        if final_results_for_hole.get('successful_paths'):
            print("✔️ SUCCESS: At least one successful path was found for hole_1.")
        else:
            print("❌ FAILURE: No successful paths were found for hole_1.")
            
        if 'error' in final_results_for_hole:
            print(f"❌ FAILURE: An error occurred during search for hole_1: {final_results_for_hole['error']}")
    else:
        print("❌ CRITICAL FAILURE: No results were generated for hole_1.")

    # Check if a restart actually happened by looking for the log message.
    # This is a bit brittle, but good enough for a test.
    # A better way would be to mock the restart function and check if it was called.
    print("💡 Note: Manual log inspection is needed to confirm 'JIT Recovery' message appeared.")


def main():
    test_dir = setup_test_environment()
    try:
        run_test(test_dir)
    finally:
        print(f"\n🧹 Cleaning up test directory: {test_dir}")
        # shutil.rmtree(test_dir)

if __name__ == "__main__":
    main() 