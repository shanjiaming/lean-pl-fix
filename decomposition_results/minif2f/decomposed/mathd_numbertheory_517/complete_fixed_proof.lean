theorem mathd_numbertheory_517 : 121 * 122 * 123 % 4 = 2 := by
  have h₁ : 121 % 4 = 1 := by
    norm_num
    <;> rfl
  
  have h₂ : 122 % 4 = 2 := by
    norm_num
    <;> rfl
  
  have h₃ : 123 % 4 = 3 := by
    norm_num
    <;> rfl
  
  have h₄ : 121 * 122 * 123 % 4 = 2 := by
    norm_num
    <;>
    rfl
  
  norm_num