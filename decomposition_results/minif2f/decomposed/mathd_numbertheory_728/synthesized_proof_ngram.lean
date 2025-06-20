theorem mathd_numbertheory_728 : (29 ^ 13 - 5 ^ 13) % 7 = 3 := by
  have h₁ : 29 ^ 13 % 7 = 1 := by
    norm_num
  
  have h₂ : 5 ^ 13 % 7 = 5 := by
    norm_num
  
  have h₃ : (29 ^ 13 - 5 ^ 13) % 7 = 3 := by
    have h₄ : (29 ^ 13 - 5 ^ 13) % 7 = 3 := by
      norm_num
    norm_num
  
  norm_num
