theorem mathd_numbertheory_207 : 8 * 9 ^ 2 + 5 * 9 + 2 = 695 := by
  have h₁ : 9 ^ 2 = 81 := by
    norm_num
  
  have h₂ : 8 * 9 ^ 2 = 648 := by
    norm_num
  
  have h₃ : 5 * 9 = 45 := by
    norm_num
  
  have h₄ : 8 * 9 ^ 2 + 5 * 9 = 693 := by
    norm_num
  
  have h₅ : 8 * 9 ^ 2 + 5 * 9 + 2 = 695 := by
    norm_num
  
  norm_num
