theorem h₆ (x y z : ℝ) (h₀ : x ≠ 0) (h₁ : 2 * x = 5 * y) (h₂ : 7 * y = 10 * z) (h₃ : 14 * x = 35 * y) (h₄ : 35 * y = 50 * z) (h₅ : 14 * x = 50 * z) : z = 7 / 25 * x := by
  have h₆₁ : 14 * x = 50 * z := h₅
  have h₆₂ : z = (7 : ℝ) / 25 * x := by sorry
  --  exact h₆₂
  linarith