#!/usr/bin/env python3
"""
Test Basic Tactic Execution

Test basic tactic execution using the Lean server directly, 
using the demo_ngram_validation problem as a test case.
"""

import os
import sys

sys.path.append(os.path.dirname(__file__))

from proofstep_lean_integration import MinimalLeanProofStepIntegrator
from lean_interact import ProofStep


def test_basic_tactic_execution():
    """Test basic tactic execution on real proof states"""
    print("🧪 Testing Basic Tactic Execution")
    print("=" * 50)
    
    # Use the demo_ngram_validation problem
    header_content = "import Mathlib"
    
    # Use the hole version that we know has proof states
    lean_code = """macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)

theorem nat_cast_add_eq {a b : ℕ} (h : a + b = 10) : (a : ℝ) + b + 1 = 6 + 5 := by 
  have nat_cast_add_eq1 : (a : ℝ) + b + 1 = 6 + 5 := by 
    hole_1
  have nat_cast_add_eq2 : (a : ℝ) + b + 1 = 6 + 5 := by 
    hole_2
  hole_3"""
    
    # Initialize integrator
    integrator = MinimalLeanProofStepIntegrator()
    integrator.initialize_lean_server()
    
    try:
        print("✅ Lean server initialized")
        
        # Extract proof states
        print("\n🔍 Extracting proof states...")
        server_sorries = integrator.extract_proof_states_from_sorries(header_content, lean_code)
        
        if not server_sorries:
            print("❌ No proof states found")
            return False
        
        print(f"✅ Found {len(server_sorries)} proof states")
        
        # Test tactics on each proof state
        test_tactics = ['norm_cast', 'linarith', 'omega', 'simp']
        
        for i, server_sorry in enumerate(server_sorries):
            proof_state_id = server_sorry.proof_state
            print(f"\n🎯 Testing tactics on proof state {proof_state_id}:")
            
            for tactic in test_tactics:
                try:
                    print(f"   Testing: {tactic}")
                    response = integrator.lean_server.run(ProofStep(
                        proof_state=proof_state_id,
                        tactic=tactic
                    ))
                    
                    if hasattr(response, 'error') and response.error:
                        print(f"     ❌ Error: {response.error}")
                    elif hasattr(response, 'goals'):
                        goals_count = len(response.goals)
                        if goals_count == 0:
                            print(f"     🎉 SUCCESS! Goals solved")
                        else:
                            print(f"     ⚠️  Partial: {goals_count} goals remain")
                    else:
                        print(f"     ❓ Unexpected response: {type(response)}")
                        
                except Exception as e:
                    print(f"     ❌ Exception: {e}")
        
        print(f"\n🎉 Basic tactic execution test completed!")
        return True
        
    except Exception as e:
        print(f"\n❌ Test failed: {e}")
        import traceback
        traceback.print_exc()
        return False
        
    finally:
        integrator.shutdown_lean_server()


def test_2gram_sequence():
    """Test a 2-gram sequence that we know should work"""
    print("\n🔗 Testing 2-gram Sequence")
    print("=" * 40)
    
    # Use norm_cast followed by linarith - this should work on the demo problem
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
    
    integrator = MinimalLeanProofStepIntegrator()
    integrator.initialize_lean_server()
    
    try:
        # Extract proof states
        server_sorries = integrator.extract_proof_states_from_sorries(header_content, lean_code)
        
        if not server_sorries:
            print("❌ No proof states found")
            return False
        
        # Test the known working sequence: norm_cast -> linarith
        sequence = ['norm_cast', 'linarith']
        
        for i, server_sorry in enumerate(server_sorries):
            proof_state_id = server_sorry.proof_state
            print(f"\n🎯 Testing sequence {' -> '.join(sequence)} on PS_{proof_state_id}:")
            
            current_state = proof_state_id
            
            for j, tactic in enumerate(sequence):
                try:
                    print(f"   Step {j+1}: {tactic} on PS_{current_state}")
                    response = integrator.lean_server.run(ProofStep(
                        proof_state=current_state,
                        tactic=tactic
                    ))
                    
                    if hasattr(response, 'error') and response.error:
                        print(f"     ❌ Error: {response.error}")
                        break
                    elif hasattr(response, 'goals'):
                        goals_count = len(response.goals)
                        if goals_count == 0:
                            print(f"     🎉 SUCCESS! All goals solved by {tactic}")
                            break
                        else:
                            print(f"     ✅ {tactic} succeeded, {goals_count} goals remain")
                            if hasattr(response, 'proof_state'):
                                current_state = response.proof_state
                                print(f"     📍 New proof state: {current_state}")
                    else:
                        print(f"     ❓ Unexpected response: {type(response)}")
                        break
                        
                except Exception as e:
                    print(f"     ❌ Exception: {e}")
                    break
        
        return True
        
    except Exception as e:
        print(f"❌ 2-gram test failed: {e}")
        return False
        
    finally:
        integrator.shutdown_lean_server()


def run_all_tests():
    """Run all basic tests"""
    print("🧪 Basic Tactic Execution Test Suite")
    print("=" * 60)
    
    tests = [
        ("Basic Tactic Execution", test_basic_tactic_execution),
        ("2-gram Sequence Test", test_2gram_sequence)
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
        print(f"✅ Basic tactic execution is working")
    else:
        print(f"\n⚠️  Some tests failed")
    
    return passed == total


if __name__ == "__main__":
    success = run_all_tests()
    sys.exit(0 if success else 1)