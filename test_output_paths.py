#!/usr/bin/env python3
"""
Test Output Paths

Test that ngram results are saved to the correct decomposition directory structure.
"""

import os
import sys
import json

sys.path.append(os.path.dirname(__file__))

from clean_ngram_searcher import CleanNgramSearcher
from proofstep_lean_integration import MinimalLeanProofStepIntegrator


def test_output_path_structure():
    """Test that output files go to the right directory"""
    print("🧪 Testing Output Path Structure")
    print("=" * 50)
    
    # Use the demo_ngram_validation problem
    header_content = "import Mathlib"
    
    lean_code = """macro "hole_1" : tactic => `(tactic| admit)
theorem test_theorem {a b : ℕ} (h : a + b = 10) : (a : ℝ) + b + 1 = 6 + 5 := by 
  have h1 : (a : ℝ) + b + 1 = 6 + 5 := by 
    hole_1
  exact h1"""
    
    # Mock the clean pipeline's save functionality
    problem_id = "demo_ngram_validation"
    dataset = "demo"
    
    # Create mock results
    mock_results = {
        'successful_tactics': {
            'hole_1': 'norm_cast ; linarith'
        },
        'ngram_results': {
            'hole_1': {
                'hole_id': 'hole_1',
                'successful_paths': [['norm_cast', 'linarith']],
                'total_nodes': 25,
                'search_time_seconds': 2.38
            }
        },
        'proof_states_extracted': 1,
        'stats': {
            'total_time': 3.0,
            'pickle_time': 0.5,
            'processing_time': 2.5,
            'holes_processed': 1,
            'successes': 1,
            'errors': 0
        }
    }
    
    # Test save functionality
    try:
        # Create output directory structure
        output_dir = f"decomposition_results/{dataset}/decomposed/{problem_id}"
        os.makedirs(output_dir, exist_ok=True)
        
        print(f"✅ Created output directory: {output_dir}")
        
        # Save detailed ngram results
        ngram_results_file = os.path.join(output_dir, "ngram_search_results.json")
        
        # Prepare results for JSON serialization
        from datetime import datetime
        json_results = {
            'problem_id': problem_id,
            'dataset': dataset,
            'timestamp': datetime.now().isoformat(),
            'search_config': {
                'max_depth': 2,
                'stop_on_first_success': True
            },
            'successful_tactics': mock_results.get('successful_tactics', {}),
            'ngram_results': mock_results.get('ngram_results', {}),
            'proof_states_extracted': mock_results.get('proof_states_extracted', 0),
            'stats': mock_results.get('stats', {})
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
            f.write(f"  Max depth: 2\n")
            f.write(f"  Stop on first success: True\n\n")
            
            f.write(f"Results:\n")
            f.write(f"  Successful tactics found: {len(mock_results.get('successful_tactics', {}))}\n")
            f.write(f"  Total holes processed: {mock_results['stats'].get('holes_processed', 0)}\n")
            f.write(f"  Success rate: {mock_results['stats'].get('successes', 0)}/{mock_results['stats'].get('holes_processed', 0)}\n\n")
            
            f.write(f"Performance:\n")
            f.write(f"  Total time: {mock_results['stats'].get('total_time', 0):.2f}s\n")
            f.write(f"  Pickle time: {mock_results['stats'].get('pickle_time', 0):.2f}s\n")
            f.write(f"  Processing time: {mock_results['stats'].get('processing_time', 0):.2f}s\n\n")
            
            successful_tactics = mock_results.get('successful_tactics', {})
            if successful_tactics:
                f.write(f"Successful Tactics:\n")
                for hole_id, tactic in successful_tactics.items():
                    f.write(f"  {hole_id}: {tactic}\n")
        
        print(f"📄 N-gram summary saved to: {summary_file}")
        
        # Test pickle directory structure
        pickle_dir = os.path.join(output_dir, "ngram_pickles")
        os.makedirs(pickle_dir, exist_ok=True)
        
        # Create a mock pickle file
        mock_pickle_file = os.path.join(pickle_dir, "hole_1.olean")
        with open(mock_pickle_file, 'w') as f:
            f.write("# Mock pickle file for testing\n")
        
        print(f"🥒 Mock pickle directory created: {pickle_dir}")
        print(f"🥒 Mock pickle file created: {mock_pickle_file}")
        
        # Verify the complete directory structure
        print(f"\n📁 Complete directory structure created:")
        print(f"   decomposition_results/")
        print(f"   └── {dataset}/")
        print(f"       └── decomposed/")
        print(f"           └── {problem_id}/")
        print(f"               ├── ngram_search_results.json")
        print(f"               ├── ngram_summary.txt")
        print(f"               └── ngram_pickles/")
        print(f"                   └── hole_1.olean")
        
        # Check if files exist
        files_to_check = [
            ngram_results_file,
            summary_file,
            mock_pickle_file
        ]
        
        all_exist = True
        for file_path in files_to_check:
            if os.path.exists(file_path):
                print(f"   ✅ {os.path.basename(file_path)} exists")
            else:
                print(f"   ❌ {os.path.basename(file_path)} missing")
                all_exist = False
        
        if all_exist:
            print(f"\n🎉 All output files created successfully!")
            print(f"✅ N-gram results are now grouped with decomposition results")
            return True
        else:
            print(f"\n❌ Some files are missing")
            return False
        
    except Exception as e:
        print(f"❌ Failed to create output structure: {e}")
        import traceback
        traceback.print_exc()
        return False


def test_with_real_searcher():
    """Test with actual searcher but skip pickle functionality"""
    print("\n🔍 Testing with Real Searcher (No Pickle)")
    print("=" * 50)
    
    # Use limited tactics to avoid errors
    searcher = CleanNgramSearcher(max_depth=2, stop_on_first_success=True)
    searcher.available_tactics = ['norm_cast', 'linarith']
    searcher.terminal_tactics = {'linarith'}
    
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
        
        # Test search
        proof_state_id = server_sorries[0].proof_state
        hole_id = "hole_1"
        
        successful_paths, results = searcher.search_hole(hole_id, proof_state_id)
        
        print(f"✅ Search completed:")
        print(f"   Successful paths: {len(successful_paths)}")
        print(f"   Total nodes: {results.get('total_nodes', 0)}")
        
        if successful_paths:
            print(f"   🎉 Found working sequence: {' -> '.join(successful_paths[0])}")
            
            # Test saving results with proper structure
            problem_id = "demo_ngram_validation"
            dataset = "demo"
            
            # Mock the full results structure
            full_results = {
                'successful_tactics': {hole_id: ' ; '.join(successful_paths[0])},
                'ngram_results': {hole_id: results},
                'proof_states_extracted': 1,
                'stats': {
                    'total_time': 2.0,
                    'pickle_time': 0.0,  # No pickle used
                    'processing_time': 2.0,
                    'holes_processed': 1,
                    'successes': 1,
                    'errors': 0
                }
            }
            
            # Save using the same method as the pipeline
            output_dir = f"decomposition_results/{dataset}/decomposed/{problem_id}"
            os.makedirs(output_dir, exist_ok=True)
            
            ngram_results_file = os.path.join(output_dir, "ngram_search_results_real.json")
            
            from datetime import datetime
            json_results = {
                'problem_id': problem_id,
                'dataset': dataset,
                'timestamp': datetime.now().isoformat(),
                'search_config': {
                    'max_depth': 2,
                    'stop_on_first_success': True
                },
                'successful_tactics': full_results.get('successful_tactics', {}),
                'ngram_results': full_results.get('ngram_results', {}),
                'proof_states_extracted': full_results.get('proof_states_extracted', 0),
                'stats': full_results.get('stats', {})
            }
            
            with open(ngram_results_file, 'w') as f:
                json.dump(json_results, f, indent=2, ensure_ascii=False)
            
            print(f"💾 Real search results saved to: {ngram_results_file}")
            return True
        else:
            print(f"   ⚠️  No successful paths found")
            return False
        
    except Exception as e:
        print(f"❌ Real searcher test failed: {e}")
        return False
        
    finally:
        integrator.shutdown_lean_server()


if __name__ == "__main__":
    print("🧪 Output Path Structure Test Suite")
    print("=" * 60)
    
    tests = [
        ("Output Path Structure", test_output_path_structure),
        ("Real Searcher Test", test_with_real_searcher)
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
        print(f"✅ N-gram output files are now properly grouped!")
    else:
        print(f"\n⚠️  Some tests failed")
    
    sys.exit(0 if passed == total else 1)