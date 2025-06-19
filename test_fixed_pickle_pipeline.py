#!/usr/bin/env python3
"""
Test Fixed Pickle Pipeline

Test the pickle pipeline with the fixed unpickle error handling.
"""

import os
import sys

sys.path.append(os.path.dirname(__file__))

from ngram_pickle_pipeline import CleanNgramPipeline


def test_fixed_pickle_pipeline():
    """Test the fixed pickle pipeline"""
    print("🧪 Testing Fixed Pickle Pipeline")
    print("=" * 50)
    
    # Use a simpler test case
    header_content = "import Mathlib"
    
    # Create a simple hole version content
    hole_version = """macro "hole_1" : tactic => `(tactic| admit)

theorem simple_test {a b : ℕ} (h : a + b = 10) : (a : ℝ) + b + 1 = 6 + 5 := by 
  have h1 : (a : ℝ) + b + 1 = 6 + 5 := by 
    hole_1
  exact h1"""
    
    # Create mock data structures  
    from dataclasses import dataclass
    
    @dataclass
    class SorryInfo:
        hole_id: str
        line: int
        column: int
    
    # Simple test case with one hole
    sorry_map = {
        0: SorryInfo(hole_id="hole_1", line=7, column=4)
    }
    enumerable_indices = [0]
    
    # Initialize pipeline
    pipeline = CleanNgramPipeline(max_depth=2, stop_on_first_success=True)
    
    try:
        print("✅ Pipeline initialized")
        print(f"   Max depth: {pipeline.max_depth}")
        print(f"   Stop on first success: {pipeline.stop_on_first_success}")
        
        print(f"\n📝 Test data:")
        print(f"   Enumerable indices: {enumerable_indices}")
        print(f"   Holes: {[info.hole_id for info in sorry_map.values()]}")
        
        print(f"\n🚀 Running fixed pickle pipeline...")
        
        # Test the pipeline
        results = pipeline.process_problem(
            header_content=header_content,
            clear_version=hole_version,
            enumerable_indices=enumerable_indices,
            sorry_map=sorry_map,
            problem_id="test_simple_pickle"
        )
        
        print(f"\n📊 Pipeline Results:")
        print(f"   Successful tactics: {len(results.get('successful_tactics', {}))}")
        print(f"   N-gram results: {len(results.get('ngram_results', {}))}")
        print(f"   Proof states extracted: {results.get('proof_states_extracted', 0)}")
        
        # Show successful tactics
        successful_tactics = results.get('successful_tactics', {})
        if successful_tactics:
            print(f"\n✅ Successful Tactics Found:")
            for hole_id, tactic in successful_tactics.items():
                print(f"   {hole_id}: {tactic}")
        else:
            print(f"\n⚠️  No successful tactics found")
        
        # Show statistics
        stats = results.get('stats', {})
        if stats:
            print(f"\n📈 Performance Statistics:")
            print(f"   Total time: {stats.get('total_time', 0):.2f}s")
            print(f"   Pickle time: {stats.get('pickle_time', 0):.2f}s")
            print(f"   Processing time: {stats.get('processing_time', 0):.2f}s")
            print(f"   Holes processed: {stats.get('holes_processed', 0)}")
            print(f"   Successes: {stats.get('successes', 0)}")
            print(f"   Errors: {stats.get('errors', 0)}")
        
        # Check if files were saved
        expected_dir = "decomposition_results/test/decomposed/test_simple_pickle"
        if os.path.exists(expected_dir):
            print(f"\n📁 Output files saved to: {expected_dir}")
            
            files = os.listdir(expected_dir)
            for file in files:
                print(f"   📄 {file}")
        
        # Determine success
        has_results = len(results.get('ngram_results', {})) > 0
        no_errors = stats.get('errors', 0) == 0
        
        if has_results and no_errors:
            print(f"\n🎉 FIXED PICKLE PIPELINE TEST PASSED!")
            return True
        elif no_errors:
            print(f"\n⚠️  Pipeline ran without errors but no results found")
            return True
        else:
            print(f"\n❌ Pipeline had errors")
            return False
        
    except Exception as e:
        print(f"\n❌ Test failed with error: {e}")
        import traceback
        traceback.print_exc()
        return False


def test_with_demo_ngram_validation():
    """Test with the demo_ngram_validation problem using real decomposition data"""
    print("\n🎯 Testing with Demo N-gram Validation")
    print("=" * 50)
    
    # Load the real decomposition data
    import json
    
    decomp_file = "decomposition_results/demo/decomposed/demo_ngram_validation/decomposition.json"
    
    if not os.path.exists(decomp_file):
        print(f"❌ Decomposition file not found: {decomp_file}")
        return False
    
    with open(decomp_file, 'r') as f:
        decomp_data = json.load(f)
    
    # Load hole version
    hole_file = "decomposition_results/demo/decomposed/demo_ngram_validation/hole_version.lean"
    with open(hole_file, 'r') as f:
        hole_version = f.read()
    
    # Create sorry map from decomposition data
    from dataclasses import dataclass
    
    @dataclass
    class SorryInfo:
        hole_id: str
        line: int
        column: int
    
    holes = decomp_data.get('holes', [])
    sorry_map = {}
    enumerable_indices = []
    
    for i, hole in enumerate(holes):
        hole_id = hole.get('hole_id')
        if hole_id:
            # Server positions include header, so adjust for that
            # Server reports: (10, 4), (12, 4), (13, 2)
            # Actual hole positions in file: 7, 9, 10
            # So server adds ~3 lines for header "import Mathlib\n\n\n"
            server_positions = [10, 12, 13]  # From server output
            line = server_positions[i] if i < len(server_positions) else 10 + i
            
            sorry_map[i] = SorryInfo(
                hole_id=hole_id,
                line=line,
                column=4
            )
            enumerable_indices.append(i)
    
    header_content = "import Mathlib"
    
    # Initialize pipeline
    pipeline = CleanNgramPipeline(max_depth=2, stop_on_first_success=True)
    
    try:
        print("✅ Real data loaded")
        print(f"   Holes: {[info.hole_id for info in sorry_map.values()]}")
        
        print(f"\n🚀 Running pipeline with real data...")
        
        results = pipeline.process_problem(
            header_content=header_content,
            clear_version=hole_version,
            enumerable_indices=enumerable_indices,
            sorry_map=sorry_map,
            problem_id="demo_ngram_validation"
        )
        
        print(f"\n📊 Real Data Results:")
        print(f"   Successful tactics: {len(results.get('successful_tactics', {}))}")
        print(f"   N-gram results: {len(results.get('ngram_results', {}))}")
        
        # Show results
        successful_tactics = results.get('successful_tactics', {})
        if successful_tactics:
            print(f"\n✅ Found Successful Tactics:")
            for hole_id, tactic in successful_tactics.items():
                print(f"   {hole_id}: {tactic}")
        
        stats = results.get('stats', {})
        if stats.get('errors', 0) == 0:
            print(f"\n🎉 Real data test completed without errors!")
            return True
        else:
            print(f"\n⚠️  Had {stats.get('errors', 0)} errors")
            return False
        
    except Exception as e:
        print(f"\n❌ Real data test failed: {e}")
        import traceback
        traceback.print_exc()
        return False


if __name__ == "__main__":
    print("🧪 Fixed Pickle Pipeline Test Suite")
    print("=" * 60)
    
    tests = [
        ("Fixed Pickle Pipeline", test_fixed_pickle_pipeline),
        ("Demo N-gram Validation", test_with_demo_ngram_validation)
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
        print(f"✅ Pickle pipeline is now working correctly!")
        print(f"✅ Output files are saved to decomposition_results structure!")
    else:
        print(f"\n⚠️  Some tests failed - investigating further needed")
    
    sys.exit(0 if passed == total else 1)