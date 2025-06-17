#!/usr/bin/env python3
"""Debug skip_hole detection"""

from proofstep_integration import ProofStepIntegrator

def test_skip_detection():
    integrator = ProofStepIntegrator()
    
    test_code = '''macro "hole_2" : tactic => `(tactic| sorry)
macro "hole_4" : tactic => `(tactic| sorry)
macro "hole_3" : tactic => `(tactic| sorry)
macro "hole_5" : tactic => `(tactic| sorry)
macro "hole_1" : tactic => `(tactic| sorry)
macro "skip_hole" : term => `(sorry)

theorem complex_have_chain (n : ℕ) (h : n > 0) : n + n ≥ n := by
  have h1 : n ≥ 1 := by
    hole_2
  clear h1
  have h1 : n ≥ 1 := skip_hole
  have h2 : n + n ≥ n + 1 := by
    have h3 : n ≥ 1 := h1
    have h4 : n + n = n + n := rfl
    have h5 : n + 1 ≤ n + n := by
      hole_4
    clear h5
    have h5 : n + 1 ≤ n + n := skip_hole
    hole_3
  clear h2
  have h2 : n + n ≥ n + 1 := skip_hole
  have h6 : n + 1 ≥ n := by
    hole_5
  clear h6
  have h6 : n + 1 ≥ n := skip_hole
  hole_1'''
    
    print("=== Debug Skip Detection ===")
    
    # Test macro structure parsing
    macro_structure = integrator.parse_macro_structure(test_code)
    
    print("Macro definitions:")
    for name, info in macro_structure['definitions'].items():
        print(f"  {name}: {info}")
    
    print("\nMacro usages:")
    for usage in macro_structure['usages']:
        print(f"  {usage['macro']} at line {usage['line']}: {usage['context']}")
    
    # Test sorry map creation
    sorry_map = integrator.create_sorry_map(test_code)
    
    print(f"\nSorry map ({len(sorry_map)} entries):")
    for idx, info in sorry_map.items():
        print(f"  Index {idx}: {info.macro_type} ({info.hole_id}) -> {'ENUM' if info.should_enumerate else 'SKIP'}")
    
    # Count expected vs actual
    expected_holes = test_code.count('hole_')
    expected_skips = test_code.count('skip_hole') - 1  # Subtract macro definition
    
    print(f"\nExpected holes: {expected_holes-5}")
    print(f"Expected skips: {expected_skips}")
    
    actual_holes = sum(1 for info in sorry_map.values() if info.macro_type == 'hole_i')
    actual_skips = sum(1 for info in sorry_map.values() if info.macro_type == 'skip_hole')
    
    print(f"Actual holes: {actual_holes}")
    print(f"Actual skips: {actual_skips}")

if __name__ == "__main__":
    test_skip_detection()