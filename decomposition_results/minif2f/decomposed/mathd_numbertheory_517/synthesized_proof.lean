theorem mathd_numbertheory_517 : 121 * 122 * 123 % 4 = 2 := by
  have h₁ : 121 % 4 = 1 := by
    norm_num
  
  have h₂ : 122 % 4 = 2 := by
    norm_num
  
  have h₃ : 123 % 4 = 3 := by
    norm_num
  
  have h₄ : 121 * 122 * 123 % 4 = 2 := by
    norm_num
  
  norm_num
