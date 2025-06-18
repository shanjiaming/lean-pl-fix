theorem mathd_algebra_275 (x : ℝ) (h : ((11 : ℝ) ^ (1 / 4)) ^ (3 * x - 3) = 1 / 5) :
    ((11 : ℝ) ^ (1 / 4)) ^ (6 * x + 2) = 121 / 25 := by
  have h₁ : (11 : ℝ) ^ (1 / 4 : ℕ) = 1 := by
    norm_num
  
  have h₂ : ((11 : ℝ) ^ (1 / 4 : ℕ)) ^ (3 * x - 3) = 1 := by
    norm_num
  
  have h₃ : False := by
    have h₄ : (1 : ℝ) = 1 / 5 := by
      linarith
    linarith
  
  have h₄ : ((11 : ℝ) ^ (1 / 4)) ^ (6 * x + 2) = 121 / 25 := by
    linarith
  
  linarith
