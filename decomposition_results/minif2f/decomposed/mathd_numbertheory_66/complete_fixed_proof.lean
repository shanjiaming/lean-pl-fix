theorem mathd_numbertheory_66 : 194 % 11 = 7:=
  by
  have h₁ : 11 * 17 = 187:= by -- norm_num <;> rfl
    norm_num
  have h₂ : 194 = 11 * 17 + 7:= by -- norm_num [h₁] <;> rfl
    norm_num
  have h₃ : 194 % 11 = 7:= by -- omega
    norm_num
  --  exact h₃
  norm_num