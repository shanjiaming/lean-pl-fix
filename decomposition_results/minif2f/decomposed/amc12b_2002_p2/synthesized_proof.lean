theorem amc12b_2002_p2 (x : ℤ) (h₀ : x = 4) :
    (3 * x - 2) * (4 * x + 1) - (3 * x - 2) * (4 * x) + 1 = 11 := by
  have h₁ : (3 * x - 2) * (4 * x + 1) - (3 * x - 2) * (4 * x) + 1 = 3 * x - 1 := by
    have h₁₁ : (3 * x - 2) * (4 * x + 1) - (3 * x - 2) * (4 * x) + 1 = (3 * x - 2) * ((4 * x + 1) - (4 * x)) + 1 := by
      linarith
    rw [h₁₁]
    have h₁₂ : (3 * x - 2) * ((4 * x + 1) - (4 * x)) + 1 = (3 * x - 2) * 1 + 1 := by
      have h₁₃ : (4 * x + 1 : ℤ) - (4 * x : ℤ) = 1 := by
        norm_num
      norm_num
    rw [h₁₂]
    have h₁₃ : (3 * x - 2 : ℤ) * 1 + 1 = 3 * x - 1 := by
      linarith
    linarith
  
  have h₂ : 3 * x - 1 = 11 := by
    linarith
  
  have h₃ : (3 * x - 2) * (4 * x + 1) - (3 * x - 2) * (4 * x) + 1 = 11 := by
    linarith
  
  linarith
