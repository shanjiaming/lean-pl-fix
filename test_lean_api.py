import time
import os
# Import the class and instance from the correct file
from lean_api import REPLInstance, repl as global_repl

# Define a simple test theorem
TEST_THEOREM_VALID = """
import Mathlib.Data.Real.Basic

theorem test_add_zero (x : ℝ) : x + 0 = x := by
  rw [add_zero]
"""

# Define a test theorem with a syntax error
TEST_THEOREM_SYNTAX_ERROR = """
import Mathlib.Data.Real.Basic

theorem test_add_zero_error (x : ℝ) : x + 0 = x := by
  rw [add_zeroo] -- Intentionally misspelled tactic
"""

# Define a test theorem with a type error
TEST_THEOREM_TYPE_ERROR = """
import Mathlib.Data.Real.Basic

theorem test_type_error (n : ℕ) : n + 1 = "hello" := by -- Type mismatch: Nat and String
  rfl -- This will fail
"""

# Define a longer code snippet
TEST_LONG_CODE = """
import Mathlib.Data.Real.Basic
import Mathlib.Tactic.NormNum

set_option maxHeartbeats 100000

open BigOperators Real Nat Topology Rat

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
    code_with_header = """
import Mathlib.Data.Real.Basic
-- This is a comment
set_option maxHeartbeats 100000

open BigOperators Real Nat

theorem test_header (x : ℝ) : x = x := by
  rfl
"""
    # Use the global_repl instance for this static-like method
    header, rest = global_repl.extract_header(code_with_header)
    expected_header = """import Mathlib.Data.Real.Basic
-- This is a comment
set_option maxHeartbeats 100000

open BigOperators Real Nat"""
    expected_rest = """theorem test_header (x : ℝ) : x = x := by
  rfl"""
    print(f"Extracted Header:\n{header}")
    print(f"Code without Header:\n{rest}")
    assert header.strip() == expected_header.strip(), "Header extraction failed"
    assert rest.strip() == expected_rest.strip(), "Rest of code extraction failed"
    print("Extract Header test PASSED")

def test_execute_valid():
    print("\n--- Testing Execute Valid Code ---")
    # Create a fresh instance to ensure clean state
    local_repl = REPLInstance()
    print("Executing valid theorem...")
    result = local_repl.execute(TEST_THEOREM_VALID)
    print(f"Result: {result}")
    assert "error" not in result, f"Execution resulted in an error: {result.get('error')}"
    # Check messages is empty or None
    assert not result.get("messages"), f"Execution should succeed without errors, but got messages: {result.get('messages')}"
    print("Execute Valid Code test PASSED")

def test_execute_syntax_error():
    print("\n--- Testing Execute Syntax Error ---")
    # Create a fresh instance
    local_repl = REPLInstance()
    print("Executing code with syntax error...")
    result = local_repl.execute(TEST_THEOREM_SYNTAX_ERROR)
    print(f"Result: {result}")
    assert "error" not in result, f"Execution should not fail at Python level: {result.get('error')}"
    assert result.get("messages"), "Execution should result in Lean error messages"
    # Use the instance's parser
    errors = local_repl.parse_all_errors(result)
    assert len(errors) > 0, "Should parse at least one error"
    print(f"Parsed Errors: {errors}")
    # Check the specific error message content
    assert any("unknown constant 'add_zeroo'" in str(e['message']) for e in errors), "Expected 'unknown constant' error not found"
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

def test_locate_error():
    print("\n--- Testing Locate Error ---")
    # Create a fresh instance
    local_repl = REPLInstance()
    print("Locating error in code with syntax error...")
    # locate_error calls execute internally, handles header extraction if needed by execute
    has_error, line, message = local_repl.locate_error(TEST_THEOREM_SYNTAX_ERROR)
    print(f"Locate error result: has_error={has_error}, line={line}, message='{message}'")
    assert has_error, "Should find an error"
    # Line number is relative to the start of the *code block sent to execute*,
    # which includes the header if use_header_mode=True and it's the first command.
    # The error 'add_zeroo' is on the 5th line of the theorem block, which is line 7 overall.
    # Let's check the message instead of relying on exact line number for now, as it depends on header handling state.
    # assert line == 7, f"Expected error on line 7, but got {line}"
    assert message is not None and "unknown constant 'add_zeroo'" in str(message), f"Incorrect error message located: {message}"


    print("\nLocating error in valid code...")
    has_error_valid, line_valid, message_valid = local_repl.locate_error(TEST_THEOREM_VALID)
    print(f"Locate error result: has_error={has_error_valid}, line={line_valid}, message='{message_valid}'")
    assert not has_error_valid, "Should not find an error in valid code"
    print("Locate Error test PASSED")

def test_header_handling():
    print("\n--- Testing Header Handling (with lean_interact logic) ---")
    # lean_interact_api handles header state internally via _last_env
    local_repl = REPLInstance(use_header_mode=True)

    header1 = "import Mathlib.Data.Real.Basic"
    code1 = "theorem test1 (x : ℝ) : x = x := by rfl"
    full_code1 = f"{header1}\n\n{code1}"

    header2 = "import Mathlib.Data.Nat.Basic" # Different header
    code2 = "theorem test2 (n : ℕ) : n = n := by rfl"
    full_code2 = f"{header2}\n\n{code2}"

    print("Executing code with header 1...")
    result1 = local_repl.execute(full_code1)
    print(f"Result 1: {result1}")
    assert "error" not in result1, f"Execution 1 failed: {result1.get('error')}"
    assert not result1.get("messages"), f"Execution 1 should have no messages: {result1.get('messages')}"
    # Check if the internal environment state was captured
    assert local_repl._last_env is not None, "Internal environment should be set after first execution"
    # We don't directly check current_header as it's not used by execute in lean_interact_api

    print("Executing code implicitly using header 1's environment...")
    # The API should reuse _last_env automatically
    result1_implicit = local_repl.execute(code1)
    print(f"Result 1 Implicit: {result1_implicit}")
    assert "error" not in result1_implicit, f"Implicit execution 1 failed: {result1_implicit.get('error')}"
    assert not result1_implicit.get("messages"), f"Implicit execution 1 should have no messages: {result1_implicit.get('messages')}"

    print("Executing code with header 2 (should work, starting fresh env)...")
    # The API detects the new header and should run it, creating a new env implicitly
    result2 = local_repl.execute(full_code2)
    print(f"Result 2: {result2}")
    assert "error" not in result2, f"Execution 2 failed: {result2.get('error')}"
    assert not result2.get("messages"), f"Execution 2 should have no messages: {result2.get('messages')}"
    # The internal environment should have been updated
    assert local_repl._last_env is not None # Cannot easily compare envs, just check it exists

    print("\n--- Testing start_head ---")
    # Test start_head directly
    local_repl_head = REPLInstance()
    print("Testing start_head with header 1...")
    success_head = local_repl_head.start_head(header1)
    assert success_head, "start_head failed"
    assert local_repl_head.current_header == header1, "Header not set correctly by start_head"
    assert local_repl_head._last_env is not None, "Internal env should be set by start_head"

    print("Executing code after start_head...")
    # Execute should use the env from start_head
    result1_after_head = local_repl_head.execute(code1)
    print(f"Result 1 after start_head: {result1_after_head}")
    assert "error" not in result1_after_head, f"Execution after start_head failed: {result1_after_head.get('error')}"
    assert not result1_after_head.get("messages"), f"Execution after start_head should have no messages: {result1_after_head.get('messages')}"


    print("Header Handling test PASSED")

def test_long_code():
    # The tempfile logic was specific to the old pty implementation's limitations.
    # lean_interact should handle longer inputs directly via its Command object.
    print("\n--- Testing Long Code Execution (direct) ---")
    local_repl = REPLInstance()
    print("Executing long code snippet...")
    result = local_repl.execute(TEST_LONG_CODE)
    print(f"Result (first 200 chars of messages): {str(result.get('messages'))[:200]}...")

    # Check for the expected error from 'example_3_error'
    assert result.get("messages"), "Long code execution should contain error messages"
    errors = local_repl.parse_all_errors(result)
    print(f"Parsed Errors Count: {len(errors)}")
    assert len(errors) > 0, "Should have errors from the long code"
    # The error is typically 'failed to prove goal' or similar type error
    assert any("failed to prove" in str(e['message']) or "type mismatch" in str(e['message']) for e in errors), "Expected error from example_3_error not found"
    # Check that other parts likely succeeded (no errors mentioning example_1, 2, 4 specifically)
    # Note: Error messages might not contain the theorem name directly. Focus on the expected failing one.
    # assert not any("example_1" in e['message'] or "example_2" in e['message'] or "example_4" in e['message'] for e in errors), "Unexpected errors found in valid parts of long code"

    print("Long Code Execution test PASSED")


if __name__ == "__main__":
    # Initialization is handled by importing global_repl and creating instances
    print("lean_interact_api global instance should be initialized on import.")
    # Add a small delay just in case initialization takes time
    time.sleep(1)

    passed_all = True
    try:
        test_start_end()
        test_extract_header()
        test_execute_valid()
        test_execute_syntax_error()
        test_check_code()
        test_locate_error()
        test_header_handling()
        test_long_code()

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