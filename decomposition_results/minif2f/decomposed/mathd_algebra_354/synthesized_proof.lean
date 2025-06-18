theorem mathd_algebra_354 (a d : ℝ) (h₀ : a + 6 * d = 30) (h₁ : a + 10 * d = 60) :
    a + 20 * d = 135 := by
  have h₂ : 4 * d = 30 := by
    have h₂₁ : 4 * d = 30 := by
      
      linarith
    linarith
  
  have h₃ : 14 * d = 105 := by
    have h₃₁ : 14 * d = (7 / 2 : ℝ) * (4 * d) := by
      linarith
    have h₃₂ : (7 / 2 : ℝ) * (4 * d) = (7 / 2 : ℝ) * 30 := by
      linarith
    have h₃₃ : (7 / 2 : ℝ) * 30 = 105 := by norm_num
    linarith
  
  have h₄ : a + 20 * d = 135 := by
    have h₄₁ : a + 20 * d = (a + 6 * d) + 14 * d := by
      linarith
    rw [h₄₁]
    
    have h₄₂ : a + 6 * d = 30 := h₀
    have h₄₃ : 14 * d = 105 := h₃
    
    linarith
  
  linarith
