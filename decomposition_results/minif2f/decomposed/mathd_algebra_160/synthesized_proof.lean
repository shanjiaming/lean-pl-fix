theorem mathd_algebra_160 (n x : ℝ) (h₀ : n + x = 97) (h₁ : n + 5 * x = 265) : n + 2 * x = 139 := by
  have h₂ : x = 42 := by
    have h₂₁ : 4 * x = 168 := by
      
      linarith
    
    linarith
  
  have h₃ : n = 55 := by
    
    have h₃₁ : n = 55 := by
      
      linarith
    
    linarith
  
  have h₄ : n + 2 * x = 139 := by
    linarith
  
  linarith
