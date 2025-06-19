theorem mathd_algebra_296 : abs ((3491 - 60) * (3491 + 60) - 3491 ^ 2 : ℤ) = 3600 := by
  have h₁ : (3491 - 60 : ℕ) = 3431 := by
    norm_num
  
  have h₂ : (3491 + 60 : ℕ) = 3551 := by
    norm_num
  
  have h₃ : (3431 : ℕ) * 3551 = 12183481 := by
    norm_num
  
  have h₄ : (3491 : ℕ) ^ 2 = 12187081 := by
    norm_num
  
  have h₅ : ((3491 - 60) * (3491 + 60) - 3491 ^ 2 : ℤ) = -3600 := by
    have h₅₁ : ((3491 - 60) * (3491 + 60) - 3491 ^ 2 : ℤ) = -3600 := by
      norm_num
    norm_num
  
  have h₆ : abs ((3491 - 60) * (3491 + 60) - 3491 ^ 2 : ℤ) = 3600 := by
    norm_num
  
  norm_num
