theorem h_main' (d✝ d : ℤ) (t : ℚ) (h_main : ↑d * t ^ 2 - 1 = 0 ∨ ↑d * t ^ 2 - 1 ≠ 0) (h_case_zero :  ↑d * t ^ 2 - 1 = 0 →    ∃ x y, x = (↑d * t ^ 2 + 1) / (↑d * t ^ 2 - 1) ∧ y = 2 * t / (↑d * t ^ 2 - 1) ∧ x ^ 2 - ↑d * y ^ 2 = 1) (h_case_nonzero :  ↑d * t ^ 2 - 1 ≠ 0 →    ∃ x y, x = (↑d * t ^ 2 + 1) / (↑d * t ^ 2 - 1) ∧ y = 2 * t / (↑d * t ^ 2 - 1) ∧ x ^ 2 - ↑d * y ^ 2 = 1) : ∃ x y, x = (↑d * t ^ 2 + 1) / (↑d * t ^ 2 - 1) ∧ y = 2 * t / (↑d * t ^ 2 - 1) ∧ x ^ 2 - ↑d * y ^ 2 = 1 := by
  cases h_main with
  | inl h => exact h_case_zero h
  | inr h => exact h_case_nonzero h
  hole