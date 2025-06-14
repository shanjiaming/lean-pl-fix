theorem algebra_absxm1pabsxpabsxp1eqxp2_0leqxleq1 (x : ℝ)
    (h₀ : abs (x - 1) + abs x + abs (x + 1) = x + 2) : 0 ≤ x ∧ x ≤ 1 := by
  have h₁ : 0 ≤ x := by
    by_contra h
    
    have h₂ : x < 0 := by norm_num
    
    by_cases h₃ : x < -1
    · 
      have h₄ : abs (x - 1) = -(x - 1) := by
        norm_num
      have h₅ : abs x = -x := by
        norm_num
      have h₆ : abs (x + 1) = -(x + 1) := by
        norm_num
      rw [h₄, h₅, h₆] at h₀
      
      have h₇ : - (x - 1) + -x + - (x + 1) = x + 2 := by norm_num
      have h₈ : x = -1 / 2 := by norm_num
      linarith
    · 
      have h₄ : x ≥ -1 := by norm_num
      have h₅ : abs (x - 1) = -(x - 1) := by
        norm_num
      have h₆ : abs x = -x := by
        norm_num
      have h₇ : abs (x + 1) = x + 1 := by
        norm_num
      rw [h₅, h₆, h₇] at h₀
      
      have h₈ : - (x - 1) + -x + (x + 1) = x + 2 := by norm_num
      have h₉ : x = 0 := by norm_num
      norm_num
  
  have h₂ : x ≤ 1 := by
    by_contra h
    
    have h₃ : x > 1 := by norm_num
    
    have h₄ : abs (x - 1) = x - 1 := by
      norm_num
    have h₅ : abs x = x := by
      norm_num
    have h₆ : abs (x + 1) = x + 1 := by
      norm_num
    
    rw [h₄, h₅, h₆] at h₀
    
    have h₇ : x = 1 := by norm_num
    norm_num
  
  have h₃ : 0 ≤ x ∧ x ≤ 1 := by
    norm_num
  
  norm_num