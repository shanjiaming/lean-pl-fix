# minimal_test.py
import time
from lean_api import REPLInstance, repl as global_repl

# Ensure the global repl is potentially ready if needed later,
# but we'll use local instances for isolated tests.
print("Initializing Lean API...")
time.sleep(1) # Give it a moment

# --- Test Cases ---
# 1. Import only
CODE_IMPORT_ONLY = """
import Mathlib.Data.Real.Basic
"""

# 2. Import + simple #check
CODE_IMPORT_CHECK = """
import Mathlib.Data.Real.Basic

#check Nat -- Check something basic from Prelude first
"""

# 3. Import + slightly more complex #check (using imported lib)
CODE_IMPORT_CHECK_REAL = """
import Mathlib.Data.Real.Basic

#check Real.zero
"""

# 4. Import + simple def
CODE_IMPORT_DEF = """
import Mathlib.Data.Real.Basic

def my_const : Nat := 5
"""

# 5. Import + simple theorem (closer to original failure)
CODE_IMPORT_THEOREM_SIMPLE = """
import Mathlib.Data.Real.Basic

theorem simple_thm : 1 + 1 = (2 : Nat) := rfl
"""

# Re-define the original failing code here for self-contained script
ORIGINAL_FAILING_CODE = """
import Mathlib.Data.Real.Basic

theorem test_add_zero (x : ℝ) : x + 0 = x := by
  rw [add_zero]
"""

# --- Test Runner ---
test_cases = {
    "Import Only": CODE_IMPORT_ONLY,
    "Import + Check Nat": CODE_IMPORT_CHECK,
    "Import + Check Real": CODE_IMPORT_CHECK_REAL,
    "Import + Def": CODE_IMPORT_DEF,
    "Import + Simple Theorem": CODE_IMPORT_THEOREM_SIMPLE,
    "Original Failing Theorem": ORIGINAL_FAILING_CODE
}


results = {}

for name, code in test_cases.items():
    print(f"\n--- Running Test: {name} ---")
    print(f"Code:\n{code}")
    # Use a fresh REPL instance for each test to ensure isolation
    local_repl = REPLInstance() # Removed work_dir
    try:
        result = local_repl.execute(code.strip()) # Use strip() just in case
        print(f"Result: {result}")
        results[name] = result
    except Exception as e:
        print(f"ERROR during execution: {e}")
        import traceback
        traceback.print_exc()
        results[name] = {"error": str(e)}
    # Clean up instance (optional, lean_interact should handle server)
    # local_repl.end()
    print("-" * (len(name) + 20))


# --- Summary ---
print("\n\n--- Test Summary ---")
all_passed = True
for name, result in results.items():
    has_error = "error" in result or (result.get("messages") and len(result["messages"]) > 0)
    status = "FAILED" if has_error else "PASSED"
    if has_error:
        all_passed = False
        print(f"{name}: {status}")
        if "error" in result:
            print(f"  Error: {result['error']}")
        if result.get("messages"):
            print(f"  Messages: {result['messages']}")
    else:
        print(f"{name}: {status}")

print("\nMinimal test finished.")
exit(0 if all_passed else 1) 