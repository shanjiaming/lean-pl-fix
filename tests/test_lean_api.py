import time
import os
import unittest # Import unittest for structure if not already present

print("--- Starting test_lean_api.py execution ---")
# Import the class and instance from the correct file
from lean_api import REPLInstance, repl as global_repl, Command # Import Command if needed for env checks

# Define the standard header
STANDARD_HEADER = """import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat"""

# Define a simple test theorem
TEST_THEOREM_VALID = f"""{STANDARD_HEADER}

theorem test_add_zero (x : ℝ) : x + 0 = x := by
  rw [add_zero]
"""

# Define a test theorem with a syntax error
TEST_THEOREM_SYNTAX_ERROR = f"""{STANDARD_HEADER}

theorem test_add_zero_error (x : ℝ) : x + 0 = x := by
  rw [add_zeroo] -- Intentionally misspelled tactic
"""

# Define a test theorem with a type error
TEST_THEOREM_TYPE_ERROR = f"""{STANDARD_HEADER}

theorem test_type_error (n : ℕ) : n + 1 = "hello" := by -- Type mismatch: Nat and String
  rfl -- This will fail
"""

# Define a longer code snippet
TEST_LONG_CODE = f"""{STANDARD_HEADER}

-- Example 1
theorem example_1 (x : ℝ) : x * (x + 1) = x^2 + x := by
  ring

-- Example 2
theorem example_2 (n : ℕ) : Even (n + n) := by
  simp [Even]
  use n
  rw [add_self]

-- Example 3 with a deliberate error
theorem example_3_error (a b : ℕ) : a + b = b + a + 1 := by -- Error in statement
  rw [add_comm] -- This will likely lead to a 'failed to prove goal' error

-- Example 4
def double (n : ℕ) := n + n

theorem double_is_even (n : ℕ) : Even (double n) := by
  unfold double
  simp [Even]
  use n
  rw [add_self]
"""

def test_start_end():
    # lean_interact starts server on init and might not have explicit start/end needed from client
    # We will test re-initialization instead
    print("\n--- Testing Initialization ---")
    # global_repl is initialized at import time
    assert global_repl.running, "Global REPL should be running after import"
    assert global_repl._server is not None, "Global REPL server should be initialized"

    # Test creating a new instance
    print("Creating local REPL instance...")
    local_repl = REPLInstance()
    assert local_repl.running, "Local REPL should be running after init"
    assert local_repl._server is not None, "Local REPL server should be initialized"
    print("Initialization test PASSED")
    # Note: No explicit end tested, as lean_interact manages the server lifecycle

def test_extract_header():
    print("\n--- Testing Extract Header ---")
    # Use the standard header plus some body
    code_with_header = f"""{STANDARD_HEADER}
-- This is a comment after header

theorem test_header (x : ℝ) : x = x := by
  rfl
"""
    # Use the global_repl instance for this static-like method
    header, rest = global_repl.extract_header(code_with_header)
    # The extracted header should include the comment line as well
    expected_header = STANDARD_HEADER + "\n-- This is a comment after header"
    expected_rest = """\ntheorem test_header (x : ℝ) : x = x := by
  rfl"""
    print(f"Extracted Header:\n{header}")
    print(f"Code without Header:\n{rest}")
    # Strip both for comparison to handle potential trailing/leading whitespace differences
    assert header.strip() == expected_header.strip(), f"Header extraction failed.\nExpected:\n{expected_header}\nGot:\n{header}"
    assert rest.strip() == expected_rest.strip(), f"Rest extraction failed.\nExpected:\n{expected_rest}\nGot:\n{rest}"
    print("Extract Header test PASSED")

def test_execute_valid():
    print("\n--- Testing Execute Valid Code (header mode) ---")
    # Create a fresh instance to ensure clean state
    local_repl = REPLInstance()
    print("Executing valid theorem with env_mode='header'...")
    # Explicitly use header mode for this test
    result = local_repl.execute(TEST_THEOREM_VALID, env_mode='header') 
    print(f"Result: {result}")
    # Check if the 'error' key in the result dictionary is None or falsey
    assert not result.get('error'), f"Execution resulted in a Python error: {result.get('error')}"
    # Check that there are no messages with severity 'error'
    messages = result.get("messages", [])
    # Use dictionary access now since execute returns parsed messages
    assert not any(msg['severity'] == 'error' for msg in messages), \
        f"Execution should succeed without errors, but got error messages: {messages}"
    # Check state updates for header mode
    assert local_repl.current_header is not None, "current_header should be set in header mode"
    assert local_repl.header_env is not None, "header_env should be set in header mode"
    assert local_repl._latest_env is not None, "_latest_env should be set in header mode"
    print("Execute Valid Code test PASSED")

def test_execute_syntax_error():
    print("\n--- Testing Execute Syntax Error (header mode) ---")
    # Create a fresh instance
    local_repl = REPLInstance()
    print("Executing code with syntax error with env_mode='header'...")
    # Explicitly use header mode
    result = local_repl.execute(TEST_THEOREM_SYNTAX_ERROR, env_mode='header') 
    print(f"Result: {result}")
    # Check if the 'error' key is None or falsey (Python level error)
    assert not result.get('error'), f"Execution should not fail at Python level: {result.get('error')}"
    # Get the messages list directly from the result (already parsed by execute)
    errors = result.get("messages", []) 
    assert errors, "Execution should result in Lean error messages"
    assert len(errors) > 0, "Should parse at least one error"
    print(f"Parsed Errors from execute result: {errors}")
    # Check the specific error message content (accept 'unknown identifier' or 'unknown constant')
    assert any("unknown identifier 'add_zeroo'" in str(e['message']) or \
               "unknown constant 'add_zeroo'" in str(e['message']) for e in errors), \
               "Expected 'unknown identifier/constant' error for 'add_zeroo' not found"
    # Check state update: Header state SHOULD be set because the header itself succeeded.
    # The error occurred in the code *after* the header.
    assert local_repl.current_header is not None, "current_header SHOULD be set as header processing succeeded"
    assert local_repl.header_env is not None, "header_env SHOULD be set as header processing succeeded"
    assert local_repl._latest_env is not None, "_latest_env should be set reflecting state after the failed command"
    print("Execute Syntax Error test PASSED")

def test_check_code():
    print("\n--- Testing Check Code ---")
    # Create a fresh instance
    local_repl = REPLInstance()
    print("Checking valid code...")
    is_valid, result_valid = local_repl.check(TEST_THEOREM_VALID)
    print(f"Valid code check: is_valid={is_valid}, result={result_valid}")
    assert is_valid, "Valid code should pass the check"

    print("\nChecking code with syntax error...")
    # Use the same instance, check if state persists correctly (it shouldn't matter much for check)
    is_invalid, result_invalid = local_repl.check(TEST_THEOREM_SYNTAX_ERROR)
    print(f"Invalid code check: is_valid={is_invalid}, result={result_invalid}")
    assert not is_invalid, "Invalid code should fail the check"
    assert result_invalid.get("messages"), "Invalid check should return error messages"
    print("Check Code test PASSED")

def test_header_handling():
    print("\n--- Testing Header Handling (env_mode='header') ---")
    # Create instance without use_header_mode arg
    local_repl = REPLInstance() 

    # Use standard header as header1
    header1 = STANDARD_HEADER
    code1 = "theorem test1_real (x : ℝ) : x = x := by rfl" # Renamed to avoid clashes
    full_code1 = f"{header1}\n\n{code1}"

    # Define a different valid header for header2
    header2 = "import Mathlib.Data.Set.Basic\nopen Set"
    code2 = "theorem test2_set (s : Set ℕ) : s = s := by rfl"
    full_code2 = f"{header2}\n\n{code2}"

    print("Executing code with header 1 (env_mode='header')...")
    result1 = local_repl.execute(full_code1, env_mode='header')
    print(f"Result 1: {result1}")
    assert not result1.get('error'), f"Execution 1 failed at Python level: {result1.get('error')}"
    messages1 = result1.get("messages", [])
    assert not any(msg['severity'] == 'error' for msg in messages1), \
        f"Execution 1 should have no error messages: {messages1}"
    # Check state after successful header execution
    # Add debug print
    print(f"DEBUG: Expected header1:\n'{header1}'")
    print(f"DEBUG: Actual current_header:\n'{local_repl.current_header}'")
    # Modify assertion to strip whitespace
    assert local_repl.current_header is not None and local_repl.current_header.strip() == header1.strip(), \
        "current_header should be set to header1 (ignoring whitespace)"
    assert local_repl.header_env is not None, "header_env should be set"
    # The env used for the *first* execution's main code should be the newly created header_env
    assert result1.get('header_env_used') == local_repl.header_env, \
        "header_env_used should be the newly created header_env for the first execution"
    # _latest_env should be updated by the execution of code1, so it won't be identical to header_env
    assert local_repl._latest_env is not None, "_latest_env should be set after initial header+code"
    env_after_header1 = local_repl.header_env
    latest_env_after_code1 = local_repl._latest_env
    # Add assertion: _latest_env should be different from header_env if code1 did something
    if code1.strip(): # Only expect difference if code was executed
        assert latest_env_after_code1 != env_after_header1, "_latest_env should differ from header_env after executing code1"

    print("Executing code 2 (no header) using header 1's environment (env_mode='header')...")
    # Define code1_b that depends on header1 (Real)
    code1_b = "theorem test1b_real (x : ℝ) : x - x = 0 := by rw [sub_self]"
    result1_b = local_repl.execute(code1_b, env_mode='header') 
    print(f"Result 1b: {result1_b}")
    assert not result1_b.get('error'), f"Execution 1b failed at Python level: {result1_b.get('error')}"
    messages1_b = result1_b.get("messages", [])
    assert not any(msg['severity'] == 'error' for msg in messages1_b), \
        f"Execution 1b should succeed using header1 env: {messages1_b}"
    # Check state: header unchanged, header_env reused, latest_env updated
    assert local_repl.current_header is not None and local_repl.current_header.strip() == header1.strip(), \
        "current_header should still be header1 (ignoring whitespace)"
    assert local_repl.header_env == env_after_header1, "header_env should not change"
    # The env used for code1_b should be the existing header_env (env_after_header1)
    assert result1_b.get('header_env_used') == env_after_header1, \
        "header_env_used should be the existing header_env for the second execution"
    assert local_repl._latest_env is not None, "_latest_env should be set"
    assert local_repl._latest_env != latest_env_after_code1, "_latest_env should be updated by code1_b"
    latest_env_after_code1b = local_repl._latest_env

    print("Executing code with header 2 (env_mode='header')...")
    result2 = local_repl.execute(full_code2, env_mode='header')
    print(f"Result 2: {result2}")
    assert not result2.get('error'), f"Execution 2 failed at Python level: {result2.get('error')}"
    messages2 = result2.get("messages", [])
    assert not any(msg['severity'] == 'error' for msg in messages2), \
        f"Execution 2 should have no error messages: {messages2}"
    # Check state: header changed, header_env changed, latest_env changed
    
    # Ensure comparison with header2 uses .strip()
    print(f"DEBUG: Expected header2:\n'{header2}'")
    print(f"DEBUG: Actual current_header:\n'{local_repl.current_header}'")
    assert local_repl.current_header is not None and local_repl.current_header.strip() == header2.strip(), \
        "current_header should be updated to header2 (ignoring whitespace)"
        
    assert local_repl.header_env is not None, "header_env should be updated"
    assert local_repl.header_env != env_after_header1, "header_env should be different from header1's env"
    # The env used for the third execution's main code should be the newly created header_env for header2
    assert result2.get('header_env_used') == local_repl.header_env, \
        "header_env_used should be the new header_env for the third execution"
    assert local_repl._latest_env is not None, "_latest_env should be set after header2+code2"
    assert local_repl._latest_env != latest_env_after_code1b, "_latest_env should be different from previous"
    # Add assertion: _latest_env should be different from header_env if code2 did something
    if code2.strip():
        assert local_repl._latest_env != local_repl.header_env, "_latest_env should differ from new header_env after executing code2"

    print("Header Handling test PASSED")

def test_long_code():
    # The tempfile logic was specific to the old pty implementation's limitations.
    # lean_interact should handle longer inputs directly via its Command object.
    print("\n--- Testing Long Code Execution (header mode) ---")
    local_repl = REPLInstance()
    print("Executing long code snippet with env_mode='header'...")
    # Explicitly use header mode
    result = local_repl.execute(TEST_LONG_CODE, env_mode='header') 
    print(f"Result (first 200 chars of messages): {str(result.get('messages'))[:200]}...")

    # Check for the expected error from 'example_3_error'
    assert result.get("messages"), "Long code execution should contain error messages"
    # Use messages directly from result, do not call parse_all_errors again
    errors = result.get("messages", []) 
    print(f"Parsed Errors Count: {len(errors)}")
    # Filter for actual error messages
    error_messages = [e for e in errors if e.get('severity') == 'error']
    assert len(error_messages) > 0, "Should have at least one error severity message"
    
    # Check for the expected error from 'example_3_error' within error messages
    # It should result in an unsolved goal after `rw [add_comm]`
    assert any("unsolved goals" in str(e['message']) or \
               "failed to prove" in str(e['message']) for e in error_messages), \
               "Expected 'unsolved goals' or 'failed to prove' error from example_3_error not found"
    
    # Check state update on partial success (header OK, body has error)
    assert local_repl.current_header is not None, "current_header should be set if header part succeeded"
    assert local_repl.header_env is not None, "header_env should be set if header part succeeded"
    # _latest_env might contain the state up to the error
    assert local_repl._latest_env is not None, "_latest_env should reflect state up to the error" 
    print("Long Code Execution test PASSED")

# --- New Tests for env_mode ---

def test_execute_fresh_mode():
    print("\n--- Testing Execute Fresh Mode ---")
    local_repl = REPLInstance()
    
    # 1. Establish some initial state using header mode - Use a simple custom def
    print("Establishing initial state with header mode (custom def)...")
    # header = STANDARD_HEADER
    # code1 = "theorem fresh_test_thm1 (x : ℝ) : x = x := by rfl"
    custom_header = "" # No imports needed for this test
    custom_def = "def my_fresh_test_const := 100"
    res_init = local_repl.execute(f"{custom_header}\n\n{custom_def}", env_mode='header')
    assert not res_init.get('error') and not any(m['severity'] == 'error' for m in res_init.get('messages', [])), "Initial header exec failed"
    initial_header = local_repl.current_header
    initial_header_env = local_repl.header_env
    initial_latest_env = local_repl._latest_env
    # assert initial_header is not None # Header is empty string, None check not useful
    assert initial_header_env is not None # Env should exist even with empty header if def succeeded
    assert initial_latest_env is not None

    # 2. Execute different code in fresh mode
    print("Executing unrelated code with env_mode='fresh'...")
    code_fresh = "theorem fresh_test_thm2 : 1 + 1 = 2 := rfl" 
    res_fresh = local_repl.execute(code_fresh, env_mode='fresh') # Default mode
    print(f"Fresh mode result: {res_fresh}")
    assert not res_fresh.get('error'), f"Fresh execution failed at Python level: {res_fresh.get('error')}"
    messages_fresh = res_fresh.get("messages", [])
    assert not any(msg['severity'] == 'error' for msg in messages_fresh), \
        f"Fresh execution should have no error messages: {messages_fresh}"
        
    # 3. Assert instance state did NOT change
    print("Verifying instance state unchanged...")
    # Allow header to be empty string
    assert local_repl.current_header == initial_header, f"current_header should NOT change after fresh mode (Is: {local_repl.current_header}, Was: {initial_header})"
    assert local_repl.header_env == initial_header_env, "header_env should NOT change after fresh mode"
    assert local_repl._latest_env == initial_latest_env, "_latest_env should NOT change after fresh mode"
    
    # 4. Assert fresh execution environment is different from the instance's latest_env
    fresh_env = res_fresh.get('env')
    assert fresh_env is not None, "Fresh execution should return an environment"
    # Check if the env returned by the isolated fresh run is different from the established latest_env
    assert fresh_env != initial_latest_env, "Environment from fresh execution should differ from instance state"

    # 5. Verify subsequent fresh execution doesn't see previous state
    print("Verifying subsequent fresh execution isolation (expecting error)...")
    # code_depends_on_header = "theorem fresh_fail (x : ℝ) : x=x := rfl"
    code_depends_on_def = "#check my_fresh_test_const" # Check the custom def
    res_fresh_fail = local_repl.execute(code_depends_on_def, env_mode='fresh')
    print(f"Second fresh mode result (expecting error): {res_fresh_fail}")
    assert res_fresh_fail.get("messages"), "Second fresh execution should produce messages (error expected)"
    # Expect 'unknown identifier' for the custom definition
    assert any(m.get('severity') == 'error' and "unknown identifier 'my_fresh_test_const'" in m.get('message', '') for m in res_fresh_fail.get('messages', [])), \
        "Fresh mode should not see custom def (unknown identifier 'my_fresh_test_const' expected)"


    print("Execute Fresh Mode test PASSED")

def test_execute_latest_mode():
    print("\n--- Testing Execute Latest Mode ---")
    local_repl = REPLInstance()

    # 1. Establish initial state with header mode
    print("Establishing initial state with header mode...")
    header = STANDARD_HEADER
    code1 = "def latest_test_def1 := 10"
    res_init = local_repl.execute(f"{header}\n\n{code1}", env_mode='header')
    assert not res_init.get('error') and not any(m['severity'] == 'error' for m in res_init.get('messages', [])), "Initial header exec failed"
    initial_header = local_repl.current_header
    initial_header_env = local_repl.header_env
    initial_latest_env = local_repl._latest_env # Env after code1
    assert initial_header is not None
    assert initial_header_env is not None
    assert initial_latest_env is not None
    assert initial_latest_env != initial_header_env # latest should be updated by code1

    # 2. Execute code depending on the definition using latest mode
    print("Executing code with env_mode='latest'...")
    code_latest = "#check latest_test_def1" # Depends on code1
    res_latest = local_repl.execute(code_latest, env_mode='latest')
    print(f"Latest mode result: {res_latest}")
    assert not res_latest.get('error'), f"Latest execution failed at Python level: {res_latest.get('error')}"
    messages_latest = res_latest.get("messages", [])
    assert not any(msg['severity'] == 'error' for msg in messages_latest), \
        f"Latest execution should succeed using previous env: {messages_latest}"
    # Optionally check for expected output in messages_latest if needed
    assert any("latest_test_def1 : ℕ" in msg.get('message', '') for msg in messages_latest), \
        "Expected #check output ('latest_test_def1 : ℕ') not found"

    # 3. Assert instance state changes correctly
    print("Verifying instance state changes...")
    assert local_repl.current_header == initial_header, "current_header should NOT change after latest mode"
    assert local_repl.header_env == initial_header_env, "header_env should NOT change after latest mode"
    assert local_repl._latest_env is not None, "_latest_env should exist"
    assert local_repl._latest_env != initial_latest_env, "_latest_env SHOULD change after latest mode execution"
    
    # 4. Check that header state was not used if different
    # Execute something using 'latest' that would fail if header_env was used
    code_latest_fail_in_header = "#check Set" # Set is not in STANDARD_HEADER
    res_latest_2 = local_repl.execute(code_latest_fail_in_header, env_mode='latest')
    # This should succeed because the latest_env (after #check) still has header context implicitly
    assert not any(m['severity'] == 'error' for m in res_latest_2['messages']), "Latest mode should still work even if header is different"


    print("Execute Latest Mode test PASSED")


# --- Main Execution Logic ---

# Create a list of test functions to run
# Note: Order might matter if tests depend on global state, but these try to use local instances.
test_functions = [
    test_start_end,
    test_extract_header,
    test_execute_valid,
    test_execute_syntax_error,
    test_check_code,
    test_header_handling,
    test_execute_fresh_mode,
    test_execute_latest_mode,
    test_long_code
]

if __name__ == "__main__":
    # Initialization is handled by importing global_repl and creating instances
    print("lean_interact_api global instance should be initialized on import.")
    # Add a small delay just in case initialization takes time
    # time.sleep(1) # Removed sleep, assume initialization is synchronous enough

    passed_all = True
    try:
        for test_func in test_functions:
            test_func()

        print("\n--------------------")
        print("All tests PASSED!")
        print("--------------------")

    except AssertionError as e:
        passed_all = False
        print("\n--------------------")
        print(f"Test FAILED: {e}")
        import traceback
        traceback.print_exc() # Print full traceback for assertion errors
        print("--------------------")
    except Exception as e:
        passed_all = False
        print("\n--------------------")
        print(f"An unexpected error occurred during testing: {e}")
        import traceback
        traceback.print_exc()
        print("--------------------")
    # finally:
        # No explicit cleanup needed for global_repl if lean_interact manages server lifecycle

    # Exit with status code 0 if all passed, 1 otherwise
    exit(0 if passed_all else 1) 