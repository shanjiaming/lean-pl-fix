#!/usr/bin/env python3
"""
Debug Pickle Functionality

Debug why PickleProofState is failing and try to fix it.
"""

import os
import sys

sys.path.append(os.path.dirname(__file__))

from proofstep_lean_integration import MinimalLeanProofStepIntegrator
from lean_interact import PickleProofState, UnpickleProofState


def debug_pickle_basic():
    """Debug basic pickle functionality"""
    print("🔧 Debugging Basic Pickle Functionality")
    print("=" * 50)
    
    header_content = "import Mathlib"
    lean_code = """macro "hole_1" : tactic => `(tactic| admit)

theorem test_theorem {a b : ℕ} (h : a + b = 10) : (a : ℝ) + b + 1 = 6 + 5 := by 
  have h1 : (a : ℝ) + b + 1 = 6 + 5 := by 
    hole_1
  exact h1"""
    
    integrator = MinimalLeanProofStepIntegrator()
    integrator.initialize_lean_server()
    
    try:
        print("✅ Lean server initialized")
        
        # First extract proof states
        print("\n🔍 Extracting proof states...")
        server_sorries = integrator.extract_proof_states_from_sorries(header_content, lean_code)
        
        if not server_sorries:
            print("❌ No proof states found")
            return False
        
        print(f"✅ Found {len(server_sorries)} proof states")
        
        # Try to pickle the first proof state
        proof_state_id = server_sorries[0].proof_state
        pickle_file = "/tmp/test_pickle.olean"
        
        print(f"\n🥒 Attempting to pickle proof state {proof_state_id}...")
        print(f"   Target file: {pickle_file}")
        
        try:
            # Create the pickle command
            pickle_cmd = PickleProofState(
                proof_state=proof_state_id,
                pickle_to=pickle_file
            )
            
            print(f"✅ Pickle command created: {pickle_cmd}")
            
            # Execute the pickle command
            print(f"🔄 Executing pickle command...")
            result = integrator.lean_server.run(pickle_cmd)
            
            print(f"✅ Pickle command executed successfully!")
            print(f"   Result: {result}")
            
            # Check if file was created
            if os.path.exists(pickle_file):
                file_size = os.path.getsize(pickle_file)
                print(f"✅ Pickle file created: {pickle_file} ({file_size} bytes)")
                
                # Try to unpickle it
                print(f"\n📦 Attempting to unpickle...")
                
                unpickle_cmd = UnpickleProofState(
                    unpickle_proof_state_from=pickle_file,
                    env=1
                )
                
                unpickle_result = integrator.lean_server.run(unpickle_cmd)
                print(f"✅ Unpickle successful!")
                print(f"   Restored proof state: {unpickle_result.proof_state}")
                
                # Clean up
                os.remove(pickle_file)
                print(f"🧹 Cleaned up pickle file")
                
                return True
            else:
                print(f"❌ Pickle file was not created")
                return False
                
        except Exception as pickle_error:
            print(f"❌ Pickle operation failed: {pickle_error}")
            print(f"   Error type: {type(pickle_error)}")
            
            # Let's try a different approach - maybe the file path is the issue
            print(f"\n🔄 Trying with absolute path...")
            
            abs_pickle_file = os.path.abspath("test_pickle_abs.olean")
            print(f"   Absolute path: {abs_pickle_file}")
            
            try:
                pickle_cmd_abs = PickleProofState(
                    proof_state=proof_state_id,
                    pickle_to=abs_pickle_file
                )
                
                result_abs = integrator.lean_server.run(pickle_cmd_abs)
                print(f"✅ Absolute path pickle succeeded!")
                
                if os.path.exists(abs_pickle_file):
                    print(f"✅ File created with absolute path")
                    os.remove(abs_pickle_file)
                    return True
                else:
                    print(f"❌ File still not created")
                    return False
                    
            except Exception as abs_error:
                print(f"❌ Absolute path also failed: {abs_error}")
                return False
        
    except Exception as e:
        print(f"❌ Debug failed: {e}")
        import traceback
        traceback.print_exc()
        return False
        
    finally:
        integrator.shutdown_lean_server()


def debug_server_state():
    """Debug the server state to understand why pickle might fail"""
    print("\n🔧 Debugging Server State")
    print("=" * 40)
    
    integrator = MinimalLeanProofStepIntegrator()
    integrator.initialize_lean_server()
    
    try:
        print("✅ Server initialized")
        
        # Try a simple operation first
        from lean_interact import ProofStep
        
        # Let's see if we can even run basic commands
        print("\n🧪 Testing basic server operations...")
        
        # Test with a simple proof state operation
        header_content = "import Mathlib"
        lean_code = "theorem simple_test : 1 + 1 = 2 := by norm_num"
        
        server_sorries = integrator.extract_proof_states_from_sorries(header_content, lean_code)
        print(f"✅ Basic extraction works: {len(server_sorries)} sorries")
        
        # Let's see what happens if we try pickle on a working proof
        working_code = """theorem working_theorem : 1 + 1 = 2 := by
  sorry"""
        
        working_sorries = integrator.extract_proof_states_from_sorries(header_content, working_code)
        
        if working_sorries:
            working_proof_state = working_sorries[0].proof_state
            print(f"✅ Found working proof state: {working_proof_state}")
            
            # Try pickle on this simpler state
            simple_pickle_file = "simple_test.olean"
            
            try:
                simple_pickle_cmd = PickleProofState(
                    proof_state=working_proof_state,
                    pickle_to=simple_pickle_file
                )
                
                print(f"🥒 Trying pickle on simple proof state...")
                simple_result = integrator.lean_server.run(simple_pickle_cmd)
                
                print(f"✅ Simple pickle worked!")
                
                if os.path.exists(simple_pickle_file):
                    print(f"✅ Simple pickle file created")
                    os.remove(simple_pickle_file)
                    
                    print(f"🎉 Pickle functionality is working!")
                    print(f"   The issue might be with specific proof states or file paths")
                    return True
                    
            except Exception as simple_error:
                print(f"❌ Even simple pickle failed: {simple_error}")
                return False
        
        return False
        
    except Exception as e:
        print(f"❌ Server state debug failed: {e}")
        return False
        
    finally:
        integrator.shutdown_lean_server()


def run_all_debug_tests():
    """Run all debugging tests"""
    print("🔧 Pickle Functionality Debug Suite")
    print("=" * 60)
    
    tests = [
        ("Basic Pickle Functionality", debug_pickle_basic),
        ("Server State Debug", debug_server_state)
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
    print(f"🔧 DEBUG SUMMARY")
    print(f"=" * 60)
    
    passed = sum(1 for _, success in results if success)
    total = len(results)
    
    for test_name, success in results:
        status = "✅ PASSED" if success else "❌ FAILED"
        print(f"   {test_name}: {status}")
    
    print(f"\nSuccess Rate: {passed}/{total} ({passed/total*100:.1f}%)")
    
    if passed > 0:
        print(f"\n💡 Pickle functionality appears to work in some cases")
        print(f"   The issue might be specific to certain proof states or contexts")
    else:
        print(f"\n⚠️  Pickle functionality seems to have fundamental issues")
        print(f"   May need to investigate Lean server configuration or version")
    
    return passed > 0


if __name__ == "__main__":
    success = run_all_debug_tests()
    sys.exit(0 if success else 1)