theorem mathd_algebra_33 (x y z : ℝ) (h₀ : x ≠ 0) (h₁ : 2 * x = 5 * y) (h₂ : 7 * y = 10 * z) :
    z / x = 7 / 25 := by
  have h₃ : 14 * x = 35 * y := by
    have h₃₁ : 14 * x = 35 * y := by
      have h₃₂ : 2 * x = 5 * y := h₁
      have h₃₃ : 7 * (2 * x) = 7 * (5 * y) := by admit
      have h₃₄ : 7 * (2 * x) = 14 * x := by admit
      have h₃₅ : 7 * (5 * y) = 35 * y := by admit
      admit
    admit
  
  have h₄ : 35 * y = 50 * z := by
    have h₄₁ : 7 * y = 10 * z := h₂
    have h₄₂ : 5 * (7 * y) = 5 * (10 * z) := by admit
    have h₄₃ : 5 * (7 * y) = 35 * y := by admit
    have h₄₄ : 5 * (10 * z) = 50 * z := by admit
    admit
  
  have h₅ : 14 * x = 50 * z := by
    admit
  
  have h₆ : z = (7 : ℝ) / 25 * x := by
    have h₆₁ : 14 * x = 50 * z := h₅
    have h₆₂ : z = (7 : ℝ) / 25 * x := by
      have h₆₃ : 50 * z = 14 * x := by admit
      have h₆₄ : z = (14 : ℝ) / 50 * x := by
        
        admit
      
      have h₆₅ : z = (7 : ℝ) / 25 * x := by
        admit
      admit
    admit
  
  have h₇ : z / x = 7 / 25 := by
    rw [h₆]
    have h₇₁ : (7 : ℝ) / 25 * x / x = 7 / 25 := by
      have h₇₂ : x ≠ 0 := h₀
      admit
    admit
  
  admit