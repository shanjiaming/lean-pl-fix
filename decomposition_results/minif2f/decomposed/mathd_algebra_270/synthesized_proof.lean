theorem mathd_algebra_270 (f : ℝ → ℝ) (h₀ : ∀ (x) (_ : x ≠ -2), f x = 1 / (x + 2)) :
    f (f 1) = 3 / 7 := by
  have h₁ : f 1 = 1 / 3 := by
    have h₁₁ : (1 : ℝ) ≠ -2 := by norm_num
    have h₁₂ : f 1 = 1 / (1 + 2 : ℝ) := h₀ 1 h₁₁
    linarith
  
  have h₂ : f (f 1) = f (1 / 3) := by
    admit
  
  have h₃ : f (1 / 3) = 3 / 7 := by
    have h₃₁ : (1 / 3 : ℝ) ≠ -2 := by norm_num
    have h₃₂ : f (1 / 3 : ℝ) = 1 / ((1 / 3 : ℝ) + 2 : ℝ) := h₀ (1 / 3 : ℝ) h₃₁
    linarith
  
  have h₄ : f (f 1) = 3 / 7 := by
    linarith
  
  linarith
