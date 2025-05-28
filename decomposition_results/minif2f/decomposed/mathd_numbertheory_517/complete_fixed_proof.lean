theorem mathd_numbertheory_517 : 121 * 122 * 123 % 4 = 2:=
  by
  have h₁ : 121 % 4 = 1:= by -- norm_num <;> rfl
    norm_num
  have h₂ : 122 % 4 = 2:= by -- norm_num <;> rfl
    norm_num
  have h₃ : 123 % 4 = 3:= by -- norm_num <;> rfl
    norm_num
  have h₄ : 121 * 122 * 123 % 4 = 2:= by
    --  norm_num [h₁, h₂, h₃, Nat.mul_mod, Nat.add_mod, Nat.mod_mod, Nat.mod_eq_of_lt] <;> rfl
    norm_num
  --  apply h₄
  norm_num