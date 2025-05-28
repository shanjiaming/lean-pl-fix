theorem mathd_numbertheory_728 : (29 ^ 13 - 5 ^ 13) % 7 = 3:=
  by
  have h₁ : 29 ^ 13 % 7 = 1:= by -- norm_num [Nat.pow_mod, Nat.mod_mod, Nat.mod_eq_of_lt, show 2 ≤ 7 by -- norm_num] <;> rfl
    norm_num
  have h₂ : 5 ^ 13 % 7 = 5:= by -- norm_num [Nat.pow_mod, Nat.mod_mod, Nat.mod_eq_of_lt, show 2 ≤ 7 by -- norm_num] <;> rfl
    norm_num
  have h₃ : (29 ^ 13 - 5 ^ 13) % 7 = 3:=
    by
    have h₄ : (29 ^ 13 - 5 ^ 13) % 7 = 3:= by -- omega
      norm_num
    --  exact h₄
    norm_num
  --  apply h₃
  norm_num