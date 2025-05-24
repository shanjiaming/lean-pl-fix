#!/usr/bin/env python3

from decompose_solver import unified_env

def test_verification():
    print("Testing Lean code verification...")
    
    # Test 1: Simple valid code
    code1 = """import Mathlib
theorem test1 : 1 + 1 = 2 := by norm_num"""
    
    print(f"Test 1 - Valid code:")
    print(f"Code: {code1}")
    try:
        result1 = unified_env.verify_lean_code(code1)
        print(f"Result: {result1}")
    except Exception as e:
        import traceback
        print(f"Error: {e}")
        print(f"Traceback: {traceback.format_exc()}")
    
    # Test 2: Invalid code
    code2 = """import Mathlib
theorem test2 : 1 + 1 = 3 := by norm_num"""
    
    print(f"\nTest 2 - Invalid code:")
    print(f"Code: {code2}")
    try:
        result2 = unified_env.verify_lean_code(code2)
        print(f"Result: {result2}")
    except Exception as e:
        import traceback
        print(f"Error: {e}")
        print(f"Traceback: {traceback.format_exc()}")
    
    # Test 3: Code with syntax error
    code3 = """import Mathlib
theorem test3 : 1 + 1 = 2 := by invalid_tactic"""
    
    print(f"\nTest 3 - Syntax error:")
    print(f"Code: {code3}")
    try:
        result3 = unified_env.verify_lean_code(code3)
        print(f"Result: {result3}")
    except Exception as e:
        import traceback
        print(f"Error: {e}")
        print(f"Traceback: {traceback.format_exc()}")

if __name__ == "__main__":
    test_verification() 