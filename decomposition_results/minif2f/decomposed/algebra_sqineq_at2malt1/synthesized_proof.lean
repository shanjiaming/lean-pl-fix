theorem algebra_sqineq_at2malt1 (a : ℝ) : a * (2 - a) ≤ 1 := by
  have h₀ : a * (2 - a) = 2 * a - a ^ 2 := by
    linarith

  have h₁ : (a - 1) ^ 2 ≥ 0 := by
    
    nlinarith

  have h₂ : a * (2 - a) ≤ 1 := by
    have h₃ : 2 * a - a ^ 2 ≤ 1 := by
      
      linarith
    
    linarith

  linarith
