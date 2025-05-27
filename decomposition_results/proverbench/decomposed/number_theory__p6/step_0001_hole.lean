theorem rational_solutions_of_pell_equation (d✝ d : ℤ) (t : ℚ) : ∃ x y, x = (↑d * t ^ 2 + 1) / (↑d * t ^ 2 - 1) ∧ y = 2 * t / (↑d * t ^ 2 - 1) ∧ x ^ 2 - ↑d * y ^ 2 = 1 :=
  by
  have h_main : (d * (t : ℚ) ^ 2 - 1 : ℚ) = 0 ∨ (d * (t : ℚ) ^ 2 - 1 : ℚ) ≠ 0 := by sorry
  have h_case_zero :
    (d * (t : ℚ) ^ 2 - 1 : ℚ) = 0 →
      ∃ (x y : ℚ), x = (d * t ^ 2 + 1) / (d * t ^ 2 - 1) ∧ y = 2 * t / (d * t ^ 2 - 1) ∧ x ^ 2 - d * y ^ 2 = 1 := by sorry
  have h_case_nonzero :
    (d * (t : ℚ) ^ 2 - 1 : ℚ) ≠ 0 →
      ∃ (x y : ℚ), x = (d * t ^ 2 + 1) / (d * t ^ 2 - 1) ∧ y = 2 * t / (d * t ^ 2 - 1) ∧ x ^ 2 - d * y ^ 2 = 1 := by sorry
  have h_main' :
    ∃ (x y : ℚ), x = (d * t ^ 2 + 1) / (d * t ^ 2 - 1) ∧ y = 2 * t / (d * t ^ 2 - 1) ∧ x ^ 2 - d * y ^ 2 = 1 := by sorry
  exact h_main'
  hole