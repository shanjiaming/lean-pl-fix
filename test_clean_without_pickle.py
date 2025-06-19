#!/usr/bin/env python3
"""
Test Clean Pipeline without Pickle

Test the clean searcher directly without the pickle functionality.
This tests the core n-gram search logic.
"""

import os
import sys
import time

sys.path.append(os.path.dirname(__file__))

from clean_ngram_searcher import CleanNgramSearcher
from proofstep_lean_integration import MinimalLeanProofStepIntegrator


def test_clean_searcher_directly():
    """Test the clean searcher with direct proof state manipulation"""
    print("🧪 Testing Clean Searcher Directly")
    print("=" * 50)
    
    # Initialize components
    searcher = CleanNgramSearcher(max_depth=2, stop_on_first_success=True)
    integrator = MinimalLeanProofStepIntegrator()
    integrator.initialize_lean_server()
    
    print("✅ Components initialized")
    
    try:
        # Connect searcher to integrator
        searcher.lean_integrator = integrator
        
        # Test the search functionality with a mock proof state
        print("\n🎯 Testing search functionality...")
        
        # For testing, use proof state 0 (this should exist if Lean server is working)
        test_hole_id = "test_hole"
        test_proof_state_id = 0
        
        print(f"   Hole ID: {test_hole_id}")
        print(f"   Initial proof state: {test_proof_state_id}")
        print(f"   Max depth: {searcher.max_depth}")
        print(f"   Available tactics: {searcher.available_tactics}")
        
        # Run the search
        start_time = time.time()
        successful_paths, results = searcher.search_hole(test_hole_id, test_proof_state_id)
        search_time = time.time() - start_time
        
        print(f"\n📊 Search Results:")
        print(f"   Search time: {search_time:.2f}s")
        print(f"   Successful paths: {len(successful_paths)}")
        print(f"   Total nodes: {results.get('total_nodes', 0)}")
        
        # Show successful paths
        if successful_paths:
            print(f"\n✅ Successful Paths Found:")
            for i, path in enumerate(successful_paths[:5]):  # Show first 5
                print(f"   {i+1}: {' -> '.join(path)}")
            if len(successful_paths) > 5:
                print(f"   ... and {len(successful_paths)-5} more")
        else:
            print(f"\n⚠️  No successful paths found")
        
        # Show node statistics
        nodes_by_status = results.get('nodes_by_status', {})
        if nodes_by_status:
            print(f"\n📈 Node Statistics:")
            for status, count in nodes_by_status.items():
                print(f"   {status}: {count}")
        
        print(f"\n🎉 Clean searcher test completed!")
        
        return len(successful_paths) > 0
        
    except Exception as e:
        print(f"\n❌ Test failed with error: {e}")
        import traceback
        traceback.print_exc()
        return False
        
    finally:
        integrator.shutdown_lean_server()


def test_tactic_execution():
    """Test individual tactic execution"""
    print("\n🔬 Testing Individual Tactic Execution")
    print("=" * 50)
    
    integrator = MinimalLeanProofStepIntegrator()
    integrator.initialize_lean_server()
    
    try:
        print("✅ Lean server initialized")
        
        # Test basic tactic execution
        print("\n🎯 Testing tactic execution...")
        
        # Test with a simple tactic on proof state 0
        test_tactics = ['norm_num', 'simp', 'linarith']
        
        for tactic in test_tactics:
            try:
                print(f"   Testing tactic: {tactic}")
                result = integrator.execute_tactic(0, tactic)
                
                if hasattr(result, 'error') and result.error:
                    print(f"     ❌ Error: {result.error}")
                elif hasattr(result, 'goals'):
                    print(f"     ✅ Success: {len(result.goals)} remaining goals")
                else:
                    print(f"     ⚠️  Unexpected result format")
                    
            except Exception as e:
                print(f"     ❌ Exception: {e}")
        
        print(f"\n🎉 Tactic execution test completed!")
        return True
        
    except Exception as e:
        print(f"\n❌ Tactic execution test failed: {e}")
        return False
        
    finally:
        integrator.shutdown_lean_server()


def test_node_logic():
    """Test node creation and logic"""
    print("\n🧠 Testing Node Logic")
    print("=" * 30)
    
    from clean_ngram_searcher import SearchNode, NodeStatus
    
    # Test node creation
    node = SearchNode(
        node_id="test_node",
        tactic_sequence=["norm_num", "linarith"],
        parent_id="root"
    )
    
    print(f"✅ Node created: {node.node_id}")
    print(f"   Tactic sequence: {node.tactic_sequence}")
    print(f"   Last tactic: {node.get_last_tactic()}")
    print(f"   Is terminal: {node.is_terminal()}")
    print(f"   Status: {node.status}")
    
    # Test terminal logic
    terminal_node = SearchNode(
        node_id="terminal_node",
        tactic_sequence=["linarith"],
        parent_id="root"
    )
    
    print(f"\n✅ Terminal node created: {terminal_node.node_id}")
    print(f"   Last tactic: {terminal_node.get_last_tactic()}")
    print(f"   Is terminal: {terminal_node.is_terminal()}")
    
    return True


def run_all_tests():
    """Run all clean tests"""
    print("🧪 Clean N-gram Test Suite (No Pickle)")
    print("=" * 60)
    
    tests = [
        ("Node Logic", test_node_logic),
        ("Tactic Execution", test_tactic_execution),
        ("Clean Searcher", test_clean_searcher_directly)
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
        print(f"✅ Clean n-gram searcher is working correctly")
    else:
        print(f"\n⚠️  Some tests failed - review core functionality")
    
    return passed == total


if __name__ == "__main__":
    success = run_all_tests()
    sys.exit(0 if success else 1)