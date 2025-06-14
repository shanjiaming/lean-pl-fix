theorem mathd_algebra_359 (y : ℝ) (h₀ : y + 6 + y = 2 * 12) : y = 9 := by
  have h₁ : 2 * y + 6 = 24 := by
    have h₁₁ : y + 6 + y = 2 * 12 := h₀
    have h₁₂ : y + 6 + y = 2 * y + 6 := by admit
    admit
  
  have h₂ : 2 * y = 18 := by
    have h₂₁ : 2 * y + 6 = 24 := h₁
    have h₂₂ : 2 * y = 18 := by admit
    admit
  
  have h₃ : y = 9 := by
    have h₃₁ : 2 * y = 18 := h₂
    have h₃₂ : y = 9 := by admit
    admit
  
  admit