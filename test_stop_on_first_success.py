#!/usr/bin/env python3

import sys
import time
from ngram_tactic_searcher import NgramTacticSearcher
from proofstep_lean_integration import MinimalLeanProofStepIntegrator

def test_stop_on_first_success():
    """Test the stop_on_first_success option"""
    print("🧪 Testing stop_on_first_success Option")
    print("=" * 60)
    
    # Load the hole version
    hole_file = "decomposition_results/demo/decomposed/demo_ngram_validation/hole_version.lean"
    header_file = "decomposition_results/demo/decomposed/demo_ngram_validation/header.lean"
    
    try:
        with open(header_file, 'r') as f:
            header_content = f.read()
        with open(hole_file, 'r') as f:
            hole_content = f.read()
    except FileNotFoundError as e:
        print(f"❌ Failed to load files: {e}")
        return False
    
    # Get proof state
    lean_integrator = MinimalLeanProofStepIntegrator()
    proof_states = lean_integrator.extract_proof_states_from_sorries(header_content, hole_content)
    proof_state_id = 0
    
    print(f"🎯 Testing with proof_state ID: {proof_state_id}")
    
    # Test 1: With stop_on_first_success=True (default)
    print(f"\n🚀 Test 1: stop_on_first_success=True (should stop after first success)")
    searcher1 = NgramTacticSearcher(max_depth=2, stop_on_first_success=True)
    searcher1.lean_integrator = lean_integrator
    
    start_time = time.time()
    successful_paths1, results1 = searcher1.search_hole("test_stop_true", proof_state_id)
    time1 = time.time() - start_time
    
    print(f"✅ Results with stop_on_first_success=True:")
    print(f"  - Found paths: {len(successful_paths1)}")
    print(f"  - Search time: {time1:.2f}s")
    print(f"  - Total nodes: {results1['total_nodes']}")
    print(f"  - Paths: {[' -> '.join(path) for path in successful_paths1]}")
    
    # Test 2: With stop_on_first_success=False 
    print(f"\n🚀 Test 2: stop_on_first_success=False (should find all solutions)")
    searcher2 = NgramTacticSearcher(max_depth=2, stop_on_first_success=False)
    searcher2.lean_integrator = lean_integrator
    
    start_time = time.time()
    successful_paths2, results2 = searcher2.search_hole("test_stop_false", proof_state_id)
    time2 = time.time() - start_time
    
    print(f"✅ Results with stop_on_first_success=False:")
    print(f"  - Found paths: {len(successful_paths2)}")
    print(f"  - Search time: {time2:.2f}s") 
    print(f"  - Total nodes: {results2['total_nodes']}")
    print(f"  - Paths: {[' -> '.join(path) for path in successful_paths2]}")
    
    # Analysis
    print(f"\n📊 Comparison Analysis:")
    print(f"  - Early stop found: {len(successful_paths1)} path(s)")
    print(f"  - Full search found: {len(successful_paths2)} path(s)")
    print(f"  - Time saved: {time2 - time1:.2f}s ({((time2-time1)/time2*100):.1f}% faster)")
    print(f"  - Nodes saved: {results2['total_nodes'] - results1['total_nodes']} nodes")
    
    # Validation
    success = True
    if len(successful_paths1) == 0:
        print(f"❌ FAIL: Early stop should find at least 1 path")
        success = False
    elif len(successful_paths1) >= len(successful_paths2):
        print(f"❌ FAIL: Early stop should find fewer paths than full search")
        success = False
    elif successful_paths1[0] not in successful_paths2:
        print(f"❌ FAIL: Early stop path should be in full search results")
        success = False
    else:
        print(f"✅ PASS: Early stop option works correctly!")
    
    lean_integrator.shutdown_lean_server()
    return success

if __name__ == "__main__":
    print("🔧 Testing Stop-on-First-Success Feature")
    print("=" * 60)
    
    success = test_stop_on_first_success()
    
    if success:
        print("\n✅ ALL TESTS PASSED!")
        print("The stop_on_first_success option works correctly!")
    else:
        print("\n❌ TESTS FAILED!")
        sys.exit(1)