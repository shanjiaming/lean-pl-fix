theorem algebra_absxm1pabsxpabsxp1eqxp2_0leqxleq1 (x : ℝ)
    (h₀ : abs (x - 1) + abs x + abs (x + 1) = x + 2) : 0 ≤ x ∧ x ≤ 1 := by
  have h₁ : 0 ≤ x := by
    by_contra h
    
    have h₂ : x < 0 := by linarith
    
    by_cases h₃ : x < -1
    · 
      have h₄ : abs (x - 1) = -(x - 1) := by
        admit
      have h₅ : abs x = -x := by
        norm_num ; linarith
      have h₆ : abs (x + 1) = -(x + 1) := by
        admit
      rw [h₄, h₅, h₆] at h₀
      
      have h₇ : - (x - 1) + -x + - (x + 1) = x + 2 := by linarith
      have h₈ : x = -1 / 2 := by linarith
      linarith
    · 
      have h₄ : x ≥ -1 := by linarith
      have h₅ : abs (x - 1) = -(x - 1) := by
        admit
      have h₆ : abs x = -x := by
        norm_num ; linarith
      have h₇ : abs (x + 1) = x + 1 := by
        norm_num ; linarith
      rw [h₅, h₆, h₇] at h₀
      
      have h₈ : - (x - 1) + -x + (x + 1) = x + 2 := by linarith
      have h₉ : x = 0 := by linarith
      linarith
  
  have h₂ : x ≤ 1 := by
    by_contra h
    
    have h₃ : x > 1 := by linarith
    
    have h₄ : abs (x - 1) = x - 1 := by
      norm_num ; linarith
    have h₅ : abs x = x := by
      simpa
    have h₆ : abs (x + 1) = x + 1 := by
      norm_num ; linarith
    
    rw [h₄, h₅, h₆] at h₀
    
    have h₇ : x = 1 := by linarith
    linarith
  
  have h₃ : 0 ≤ x ∧ x ≤ 1 := by
    norm_cast
  
  simpa
