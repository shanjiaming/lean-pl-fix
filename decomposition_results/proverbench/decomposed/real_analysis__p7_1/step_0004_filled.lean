theorem h₃ (x : ℝ) (hx : x ∈ Set.Ioo 0 8) (h₁ : 0 < x) (h₂ : x < 8) : 8 * x - x ^ 2 > 0 := by
  have h₃₁ : 0 < x := h₁
  have h₃₂ : x < 8 := h₂
  have h₃₃ : 0 < 8 - x := by sorry
  have h₃₄ : 0 < x * (8 - x) := by sorry
  have h₃₅ : 8 * x - x ^ 2 = x * (8 - x) := by sorry
  --  rw [h₃₅]
  --  nlinarith
  linarith