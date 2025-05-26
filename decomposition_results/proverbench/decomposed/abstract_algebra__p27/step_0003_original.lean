theorem h₁ (a : sorry) (b : sorry) (h : sorry) (h₀ : a = 0) : b = 0 := by
  have h₂ : a * b = a * 0 := by sorry
  have h₃ : b = 0 := mul_left_cancel₀ h₀ h₂
  exact h₃