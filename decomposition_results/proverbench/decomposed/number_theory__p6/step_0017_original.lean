theorem h_case_nonzero (d : ℤ) (t : ℚ) (h_main : (↑d : ℚ) * t ^ 2 - 1 = 0 ∨ (↑d : ℚ) * t ^ 2 - 1 ≠ 0) (h_case_zero :  (↑d : ℚ) * t ^ 2 - 1 = 0 →    ∃ x y,      x = ((↑d : ℚ) * t ^ 2 + 1) / ((↑d : ℚ) * t ^ 2 - 1) ∧        y = 2 * t / ((↑d : ℚ) * t ^ 2 - 1) ∧ x ^ 2 - (↑d : ℚ) * y ^ 2 = 1) : (↑d : ℚ) * t ^ 2 - 1 ≠ 0 →
    ∃ x y,
      x = ((↑d : ℚ) * t ^ 2 + 1) / ((↑d : ℚ) * t ^ 2 - 1) ∧
        y = 2 * t / ((↑d : ℚ) * t ^ 2 - 1) ∧ x ^ 2 - (↑d : ℚ) * y ^ 2 = 1 :=
  by
  intro h₁
  have h₂ : (d * (t : ℚ) ^ 2 - 1 : ℚ) ≠ 0 := h₁
  refine' ⟨(d * t ^ 2 + 1 : ℚ) / (d * t ^ 2 - 1 : ℚ), (2 * t : ℚ) / (d * t ^ 2 - 1 : ℚ), by simp [h₂], by simp [h₂], _⟩
  have h₃ : (d * (t : ℚ) ^ 2 - 1 : ℚ) ≠ 0 := by sorry
  have h₄ : (d * t ^ 2 - 1 : ℚ) ≠ 0 := by sorry
  have h₅ : ((d * t ^ 2 + 1 : ℚ) / (d * t ^ 2 - 1 : ℚ)) ^ 2 - (d : ℚ) * ((2 * t : ℚ) / (d * t ^ 2 - 1 : ℚ)) ^ 2 = 1 := by sorry
  exact h₅