theorem h₃₃ (a b c : ℝ) (h₀ : 3 * a + b + c = -3) (h₁ : a + 3 * b + c = 9) (h₂ : a + b + 3 * c = 19) : a - b = -6 := by
  have h₃₄ : -2 * (a - b) = 12 := by sorry
  --  linarith
  linarith