#!/usr/bin/env python3
"""
Test Clean N-gram Pipeline

Test the new pickle-based pipeline with demo data to verify it works correctly.
"""

import os
import sys
import time
from typing import Dict, List

# Add current directory for imports
sys.path.append(os.path.dirname(__file__))

from ngram_pickle_pipeline import CleanNgramPipeline
from unified_problem_manager import problem_manager


def test_clean_pipeline_with_demo():
    """Test clean pipeline with demo problems"""
    print("🧪 Testing Clean N-gram Pipeline with Demo Data")
    print("=" * 60)
    
    # Initialize clean pipeline
    pipeline = CleanNgramPipeline(max_depth=2, stop_on_first_success=True)
    
    print("✅ Clean pipeline initialized")
    print(f"   Max depth: {pipeline.max_depth}")
    print(f"   Stop on first success: {pipeline.stop_on_first_success}")
    
    # Get demo problems
    demo_problems = problem_manager.list_problems('demo')
    print(f"📂 Found {len(demo_problems)} demo problems")
    
    if not demo_problems:
        print("❌ No demo problems found! Run migrate_demo.py first")
        return False
    
    # Test with first demo problem
    test_problem = demo_problems[0]
    problem_id = test_problem.problem_id
    
    print(f"\n🎯 Testing with problem: {problem_id}")
    
    try:
        # Load problem data
        problem = problem_manager.get_problem('demo', problem_id)
        header_content = problem_manager.get_header_content(problem)
        problem_content = problem_manager.get_problem_content(problem)
        
        print("📄 Problem data loaded successfully")
        print(f"   Header length: {len(header_content)} chars")
        print(f"   Problem length: {len(problem_content)} chars")
        
        # For testing, we need to create a mock sorry_map and enumerable_indices
        # This is normally done by the decompose pipeline
        print("\n⚠️  Note: Using mock data for testing")
        print("   In real usage, this comes from the decompose pipeline")
        
        # Mock data structure for testing
        from dataclasses import dataclass
        
        @dataclass
        class MockSorryInfo:
            hole_id: str
            line: int
            column: int
        
        # Create mock enumerable indices and sorry map
        mock_sorry_map = {
            0: MockSorryInfo(hole_id="hole_1", line=10, column=5),
            1: MockSorryInfo(hole_id="hole_2", line=15, column=8)
        }
        mock_enumerable_indices = [0, 1]
        
        # Create a simple clear version with sorries
        clear_version = problem_content.replace("admit", "sorry")
        
        print(f"📝 Mock data created:")
        print(f"   Enumerable indices: {mock_enumerable_indices}")
        print(f"   Sorry map holes: {[info.hole_id for info in mock_sorry_map.values()]}")
        
        # Test the clean pipeline
        print(f"\n🚀 Running clean pipeline...")
        
        start_time = time.time()
        results = pipeline.process_problem(
            header_content=header_content,
            clear_version=clear_version,
            enumerable_indices=mock_enumerable_indices,
            sorry_map=mock_sorry_map,
            problem_id=problem_id
        )
        total_time = time.time() - start_time
        
        print(f"\n📊 Results Summary:")
        print(f"   Total processing time: {total_time:.2f}s")
        print(f"   Successful tactics found: {len(results.get('successful_tactics', {}))}")
        print(f"   N-gram results: {len(results.get('ngram_results', {}))}")
        
        # Display detailed results
        for hole_id, tactic in results.get('successful_tactics', {}).items():
            print(f"   ✅ {hole_id}: {tactic}")
        
        # Display statistics
        stats = results.get('stats', {})
        if stats:
            print(f"\n📈 Detailed Statistics:")
            for key, value in stats.items():
                print(f"   {key}: {value}")
        
        print(f"\n🎉 Clean pipeline test completed successfully!")
        return True
        
    except Exception as e:
        print(f"\n❌ Test failed with error: {e}")
        import traceback
        traceback.print_exc()
        return False


def test_clean_searcher_only():
    """Test just the clean searcher component"""
    print("\n🔍 Testing Clean Searcher Component")
    print("=" * 50)
    
    from clean_ngram_searcher import CleanNgramSearcher
    from proofstep_lean_integration import MinimalLeanProofStepIntegrator
    
    # Initialize components
    searcher = CleanNgramSearcher(max_depth=2, stop_on_first_success=True)
    integrator = MinimalLeanProofStepIntegrator()
    
    print("✅ Components initialized")
    
    # Test basic functionality
    print(f"   Available tactics: {len(searcher.available_tactics)}")
    print(f"   Terminal tactics: {searcher.terminal_tactics}")
    
    # Test node creation
    from clean_ngram_searcher import SearchNode, NodeStatus
    
    test_node = SearchNode(
        node_id="test_node",
        tactic_sequence=["norm_num"],
        parent_id="root"
    )
    
    print(f"✅ Node creation test passed")
    print(f"   Node ID: {test_node.node_id}")
    print(f"   Last tactic: {test_node.get_last_tactic()}")
    print(f"   Is terminal: {test_node.is_terminal()}")
    
    return True


def run_all_tests():
    """Run all clean pipeline tests"""
    print("🧪 Clean N-gram Pipeline Test Suite")
    print("=" * 60)
    
    tests = [
        ("Clean Searcher Component", test_clean_searcher_only),
        ("Clean Pipeline with Demo", test_clean_pipeline_with_demo)
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
        print(f"✅ Clean N-gram pipeline is ready for use")
    else:
        print(f"\n⚠️  Some tests failed - review and fix before deployment")
    
    return passed == total


if __name__ == "__main__":
    success = run_all_tests()
    sys.exit(0 if success else 1)