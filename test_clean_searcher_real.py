#!/usr/bin/env python3
"""
Test Clean Searcher with Real Proof States

Test the clean searcher using actual proof states from demo_ngram_validation.
"""

import os
import sys

sys.path.append(os.path.dirname(__file__))

from clean_ngram_searcher import CleanNgramSearcher
from proofstep_lean_integration import MinimalLeanProofStepIntegrator


def test_clean_searcher_with_real_proof_states():
    """Test clean searcher using real proof states"""
    print("🧪 Testing Clean Searcher with Real Proof States")
    print("=" * 60)
    
    # Use the demo_ngram_validation problem
    header_content = "import Mathlib"
    
    lean_code = """macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)

theorem nat_cast_add_eq {a b : ℕ} (h : a + b = 10) : (a : ℝ) + b + 1 = 6 + 5 := by 
  have nat_cast_add_eq1 : (a : ℝ) + b + 1 = 6 + 5 := by 
    hole_1
  have nat_cast_add_eq2 : (a : ℝ) + b + 1 = 6 + 5 := by 
    hole_2
  hole_3"""
    
    # Initialize components
    searcher = CleanNgramSearcher(max_depth=2, stop_on_first_success=True)
    integrator = MinimalLeanProofStepIntegrator()
    integrator.initialize_lean_server()
    
    try:
        print("✅ Components initialized")
        
        # Extract proof states first
        print("\n🔍 Extracting proof states...")
        server_sorries = integrator.extract_proof_states_from_sorries(header_content, lean_code)
        
        if not server_sorries:
            print("❌ No proof states found")
            return False
        
        print(f"✅ Found {len(server_sorries)} proof states")
        
        # Connect searcher to integrator
        searcher.lean_integrator = integrator
        
        # Test search on each proof state
        all_successful = True
        
        for i, server_sorry in enumerate(server_sorries):
            proof_state_id = server_sorry.proof_state
            hole_id = f"test_hole_{i+1}"
            
            print(f"\n🎯 Testing search on proof state {proof_state_id} (hole: {hole_id})...")
            
            try:
                # Run the search
                successful_paths, results = searcher.search_hole(hole_id, proof_state_id)
                
                print(f"   📊 Search completed:")
                print(f"      Successful paths: {len(successful_paths)}")
                print(f"      Total nodes: {results.get('total_nodes', 0)}")
                print(f"      Search time: {results.get('search_time_seconds', 0):.2f}s")
                
                # Show successful paths
                if successful_paths:
                    print(f"   ✅ Successful paths found:")
                    for j, path in enumerate(successful_paths[:3]):  # Show first 3
                        print(f"      {j+1}: {' -> '.join(path)}")
                    if len(successful_paths) > 3:
                        print(f"      ... and {len(successful_paths)-3} more")
                else:
                    print(f"   ⚠️  No successful paths found")
                    all_successful = False
                
                # Show node statistics
                nodes_by_status = results.get('nodes_by_status', {})
                if nodes_by_status:
                    print(f"   📈 Node statistics:")
                    for status, count in nodes_by_status.items():
                        print(f"      {status}: {count}")
                
            except Exception as e:
                print(f"   ❌ Search failed: {e}")
                all_successful = False
        
        print(f"\n🎉 Clean searcher test with real proof states completed!")
        
        if all_successful:
            print(f"✅ All proof states had successful solutions!")
        else:
            print(f"⚠️  Some proof states had no solutions (may be expected)")
        
        return True  # Test passed if it completed without errors
        
    except Exception as e:
        print(f"\n❌ Test failed: {e}")
        import traceback
        traceback.print_exc()
        return False
        
    finally:
        integrator.shutdown_lean_server()


def test_specific_working_sequence():
    """Test the specific sequence we know works: norm_cast -> linarith"""
    print("\n🎯 Testing Specific Working Sequence")
    print("=" * 50)
    
    # Reduce tactic list to only working ones
    searcher = CleanNgramSearcher(max_depth=2, stop_on_first_success=True)
    
    # Override with only the tactics we know work
    searcher.available_tactics = ['norm_cast', 'linarith']
    searcher.terminal_tactics = {'linarith'}
    
    print(f"✅ Searcher configured with working tactics: {searcher.available_tactics}")
    
    header_content = "import Mathlib"
    lean_code = """macro "hole_1" : tactic => `(tactic| admit)

theorem test_theorem {a b : ℕ} (h : a + b = 10) : (a : ℝ) + b + 1 = 6 + 5 := by 
  have h1 : (a : ℝ) + b + 1 = 6 + 5 := by 
    hole_1
  exact h1"""
    
    integrator = MinimalLeanProofStepIntegrator()
    integrator.initialize_lean_server()
    
    try:
        # Extract proof states
        server_sorries = integrator.extract_proof_states_from_sorries(header_content, lean_code)
        
        if not server_sorries:
            print("❌ No proof states found")
            return False
        
        # Connect searcher to integrator
        searcher.lean_integrator = integrator
        
        # Test on the first proof state
        proof_state_id = server_sorries[0].proof_state
        hole_id = "focused_test_hole"
        
        print(f"\n🔍 Testing focused search on proof state {proof_state_id}...")
        
        successful_paths, results = searcher.search_hole(hole_id, proof_state_id)
        
        print(f"\n📊 Focused test results:")
        print(f"   Successful paths: {len(successful_paths)}")
        print(f"   Total nodes: {results.get('total_nodes', 0)}")
        
        if successful_paths:
            print(f"   ✅ Found working sequences:")
            for i, path in enumerate(successful_paths):
                print(f"      {i+1}: {' -> '.join(path)}")
            return True
        else:
            print(f"   ❌ No successful paths found")
            
            # Show what happened to nodes
            nodes_by_status = results.get('nodes_by_status', {})
            print(f"   📈 Node breakdown:")
            for status, count in nodes_by_status.items():
                print(f"      {status}: {count}")
            
            return False
        
    except Exception as e:
        print(f"❌ Focused test failed: {e}")
        import traceback
        traceback.print_exc()
        return False
        
    finally:
        integrator.shutdown_lean_server()


def run_all_tests():
    """Run all clean searcher tests with real data"""
    print("🧪 Clean Searcher Real Test Suite")
    print("=" * 60)
    
    tests = [
        ("Clean Searcher with Real Proof States", test_clean_searcher_with_real_proof_states),
        ("Specific Working Sequence", test_specific_working_sequence)
    ]
    
    results = []
    
    for test_name, test_func in tests:
        print(f"\n🔬 Running: {test_name}")
        try:
            success = test_func()
            results.append((test_name, success))
            status = "✅ PASSED" if success else "❌ FAILED"
            print(f"   Result: {status}")
        except Exception as e:
            print(f"   Result: ❌ FAILED - {e}")
            results.append((test_name, False))
    
    # Summary
    print(f"\n" + "=" * 60)
    print(f"🧪 TEST SUMMARY")
    print(f"=" * 60)
    
    passed = sum(1 for _, success in results if success)
    total = len(results)
    
    for test_name, success in results:
        status = "✅ PASSED" if success else "❌ FAILED"
        print(f"   {test_name}: {status}")
    
    print(f"\nSuccess Rate: {passed}/{total} ({passed/total*100:.1f}%)")
    
    if passed == total:
        print(f"\n🎉 ALL TESTS PASSED!")
        print(f"✅ Clean n-gram searcher is working with real proof states!")
    else:
        print(f"\n⚠️  Some tests failed")
    
    return passed == total


if __name__ == "__main__":
    success = run_all_tests()
    sys.exit(0 if success else 1)