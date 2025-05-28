theorem a_eq (a b : ℝ) (h₀ : a ^ 2 * b ^ 3 = 32 / 27) (h₁ : a / b ^ 3 = 27 / 4) (hb3 : b ≠ 0) : a = 27 / 4 * b ^ 3 := by
  have h₂ : b ^ 3 ≠ 0 := by sorry
  have h₃ : a = (27 / 4 : ℝ) * b ^ 3 := by sorry
  --  exact h₃
  hole