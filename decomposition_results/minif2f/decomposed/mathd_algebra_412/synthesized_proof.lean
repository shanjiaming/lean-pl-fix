theorem mathd_algebra_412 (x y : ℝ) (h₀ : x + y = 25) (h₁ : x - y = 11) : x = 18 := by
  have h₂ : 2 * x = 36 := by
    have h₃ : (x + y) + (x - y) = 25 + 11 := by
      linarith
    have h₄ : (x + y) + (x - y) = 2 * x := by
      linarith
    have h₅ : 2 * x = 36 := by
      linarith
    linarith
  
  have h₃ : x = 18 := by
    have h₄ : x = 18 := by
      
      linarith
    linarith
  
  linarith
