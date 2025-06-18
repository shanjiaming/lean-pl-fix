theorem mathd_algebra_419 (a b : ℝ) (h₀ : a = -1) (h₁ : b = 5) : -a - b ^ 2 + 3 * (a * b) = -39 := by
  have h₂ : -a = 1 := by
    linarith
  
  have h₃ : b ^ 2 = 25 := by
    nlinarith
  
  have h₄ : 3 * (a * b) = -15 := by
    nlinarith
  
  have h₅ : -a - b ^ 2 + 3 * (a * b) = -39 := by
    admit
  
  admit
