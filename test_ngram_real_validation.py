#!/usr/bin/env python3

import sys
import time
import json
from ngram_tactic_searcher import NgramTacticSearcher
from proofstep_lean_integration import MinimalLeanProofStepIntegrator

def test_ngram_validation():
    """Test n-gram search on the real validation problem that requires norm_cast + linarith"""
    print("🧪 Testing N-gram Search on Real Validation Problem")
    print("=" * 60)
    
    # Initialize searcher
    searcher = NgramTacticSearcher(max_depth=2)
    lean_integrator = MinimalLeanProofStepIntegrator()
    searcher.lean_integrator = lean_integrator
    
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
    
    print(f"📄 Header: {header_content.strip()}")
    print(f"🕳️  Hole content: {hole_content.strip()}")
    
    # Extract proof states
    proof_states = lean_integrator.extract_proof_states_from_sorries(header_content, hole_content)
    
    if not proof_states:
        print("❌ Failed to get proof state information")
        return False
    
    # Get the first proof state
    if isinstance(proof_states, list) and proof_states:
        proof_state_id = 0
    else:
        print(f"❌ Unexpected proof_states format: {type(proof_states)}")
        return False
        
    print(f"🎯 Using proof_state ID: {proof_state_id}")
    
    # Test 1: Check if individual tactics fail
    print("\n🔍 Step 1: Testing individual tactics")
    individual_results = {}
    
    for tactic in ['norm_cast', 'linarith']:
        print(f"  🧪 Testing single tactic: {tactic}")
        # Initialize new tree for single tactic test
        tree = searcher.initialize_search_for_hole(f"test_single_{tactic}", proof_state_id)
        
        # Create a node with just this tactic
        from ngram_tactic_searcher import TacticNode, TacticNodeStatus
        node = TacticNode(
            node_id=f"single_{tactic}",
            hole_id=f"test_single_{tactic}",
            tactic_sequence=[tactic],
            parent_id=None,
            depth=1
        )
        
        # Execute this single tactic
        result = searcher.execute_tactic_sequence(node, proof_state_id)
        individual_results[tactic] = result
        print(f"    Result: {result.value}")
    
    # Test 2: Run n-gram search to find 2-gram solution
    print("\n🚀 Step 2: Running n-gram search")
    start_time = time.time()
    
    try:
        successful_paths, results = searcher.search_hole(
            hole_id="validation_hole",
            initial_proof_state_id=proof_state_id
        )
        
        elapsed = time.time() - start_time
        print(f"✅ Search completed in {elapsed:.2f}s")
        
        print(f"\n📊 Search Results:")
        print(f"  - Successful paths: {len(successful_paths)}")
        print(f"  - Total nodes: {results.get('total_nodes', 0)}")
        print(f"  - Search time: {results.get('search_time', 0):.2f}s")
        
        # Check if we found the expected 2-gram
        found_expected = False
        expected_sequence = ['norm_cast', 'linarith']
        
        print(f"\n🎯 Analyzing successful paths:")
        for i, path in enumerate(successful_paths):
            print(f"  Path {i+1}: {' -> '.join(path)}")
            if path == expected_sequence:
                found_expected = True
                print(f"    ✅ Found expected 2-gram: norm_cast -> linarith")
        
        # Validation results
        print(f"\n📋 Validation Summary:")
        print(f"  ✅ Individual 'norm_cast' fails: {individual_results.get('norm_cast') != TacticNodeStatus.SUCCESS}")
        print(f"  ✅ Individual 'linarith' fails: {individual_results.get('linarith') != TacticNodeStatus.SUCCESS}")
        print(f"  ✅ N-gram search found solution: {len(successful_paths) > 0}")
        print(f"  ✅ Found expected 2-gram: {found_expected}")
        
        if found_expected and len(successful_paths) > 0:
            print(f"\n🎉 VALIDATION SUCCESS: N-gram system correctly found 2-gram solution!")
            return True
        else:
            print(f"\n❌ VALIDATION FAILED: Expected 2-gram not found")
            return False
            
    except Exception as e:
        elapsed = time.time() - start_time
        print(f"❌ Search failed after {elapsed:.2f}s with error: {e}")
        return False

if __name__ == "__main__":
    print("🔧 N-gram System Real Validation Test")
    print("=" * 60)
    print("Testing: theorem nat_cast_add_eq with norm_cast + linarith")
    print()
    
    success = test_ngram_validation()
    
    if success:
        print("\n✅ ALL VALIDATION TESTS PASSED!")
        print("The n-gram system successfully found the 2-gram solution!")
    else:
        print("\n❌ VALIDATION TESTS FAILED!")
        print("The n-gram system did not work as expected.")
        sys.exit(1)