theorem mathd_numbertheory_66 : 194 % 11 = 7 := by
  have h₁ : 11 * 17 = 187 := by
    norm_num
    <;> rfl
  
  have h₂ : 194 = 11 * 17 + 7 := by
    norm_num [h₁]
    <;> rfl
  
  have h₃ : 194 % 11 = 7 := by
    omega
  
  exact h₃