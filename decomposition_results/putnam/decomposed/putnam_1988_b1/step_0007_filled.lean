theorem h₃ (a : ℤ) (ha : a ≥ 2) (b : ℤ) (hb : b ≥ 2) (h₁ : 1 > 0) (h₂ : a - 1 > 0) : b - 1 > 0 := by
  have h₃₁ : (b : ℤ) ≥ 2 := by sorry
  have h₃₂ : (b - 1 : ℤ) > 0 := by sorry
  --  exact h₃₂
  linarith