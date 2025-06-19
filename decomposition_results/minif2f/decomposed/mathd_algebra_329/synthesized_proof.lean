macro "hole_1" : tactic => `(tactic| admit)

theorem mathd_algebra_329 (x y : ℝ) (h₀ : 3 * y = x) (h₁ : 2 * x + 5 * y = 11) : x + y = 4 := by
  have h₂ : y = 1 := by
    have h₂₁ : 11 * y = 11 := by
      linarith
    linarith
  
  have h₃ : x = 3 := by
    have h₃₁ : x = 3 * y := by linarith
    linarith
  
  have h₄ : x + y = 4 := by
    linarith
  
  linarith
