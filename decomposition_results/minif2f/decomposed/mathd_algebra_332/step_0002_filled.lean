theorem h₂ (x y : ℝ) (h₀ : (x + y) / 2 = 7) (h₁ : √(x * y) = √19) : x + y = 14 := by
  have h₂₁ : (x + y) / 2 = 7 := h₀
  have h₂₂ : x + y = 14 := by sorry
  --  exact h₂₂
  linarith