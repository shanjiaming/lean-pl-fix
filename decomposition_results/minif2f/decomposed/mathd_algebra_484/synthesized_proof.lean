theorem mathd_algebra_484 : Real.log 27 / Real.log 3 = 3 := by
  have h₀ : Real.log 27 = 3 * Real.log 3 := by
    have h₀₁ : Real.log 27 = Real.log (3 ^ 3) := by norm_num
    rw [h₀₁]
    
    have h₀₂ : Real.log (3 ^ 3) = 3 * Real.log 3 := by
      simp
    linarith
  
  have h₁ : Real.log 27 / Real.log 3 = 3 := by
    rw [h₀]
    have h₂ : Real.log 3 ≠ 0 := by
      
      have h₂₁ : Real.log 3 > 0 := Real.log_pos (by norm_num)
      norm_num
    
    norm_num
  
  linarith
