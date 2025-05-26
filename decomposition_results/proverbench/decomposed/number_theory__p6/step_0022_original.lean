theorem h_main' (d : ℤ) (t : ℚ) (h_main : (↑d : ℚ) * t ^ 2 - 1 = 0 ∨ (↑d : ℚ) * t ^ 2 - 1 ≠ 0) (h_case_zero :  (↑d : ℚ) * t ^ 2 - 1 = 0 →    ∃ x y,      x = ((↑d : ℚ) * t ^ 2 + 1) / ((↑d : ℚ) * t ^ 2 - 1) ∧        y = 2 * t / ((↑d : ℚ) * t ^ 2 - 1) ∧ x ^ 2 - (↑d : ℚ) * y ^ 2 = 1) (h_case_nonzero :  (↑d : ℚ) * t ^ 2 - 1 ≠ 0 →    ∃ x y,      x = ((↑d : ℚ) * t ^ 2 + 1) / ((↑d : ℚ) * t ^ 2 - 1) ∧        y = 2 * t / ((↑d : ℚ) * t ^ 2 - 1) ∧ x ^ 2 - (↑d : ℚ) * y ^ 2 = 1) : ∃ x y,
    x = ((↑d : ℚ) * t ^ 2 + 1) / ((↑d : ℚ) * t ^ 2 - 1) ∧
      y = 2 * t / ((↑d : ℚ) * t ^ 2 - 1) ∧ x ^ 2 - (↑d : ℚ) * y ^ 2 = 1 := by
  cases h_main with
  | inl h => exact h_case_zero h
  | inr h => exact h_case_nonzero h