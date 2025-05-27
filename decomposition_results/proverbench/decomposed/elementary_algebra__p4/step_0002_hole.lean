theorem h₁ (x y : ℚ) (h : 2 * x + 3 * y = 8 ∧ 5 * x + 9 * y = -2) : x = 26 := by
  have h₂ : 2 * x + 3 * y = 8 := h.1
  have h₃ : 5 * x + 9 * y = -2 := h.2
  have h₄ : x = 26 := by sorry
  --  exact h₄
  hole