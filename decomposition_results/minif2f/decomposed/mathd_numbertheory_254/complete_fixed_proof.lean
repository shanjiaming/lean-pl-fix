theorem mathd_numbertheory_254 : (239 + 174 + 83) % 10 = 6:=
  by
  have h₁ : (239 + 174 + 83) % 10 = 6:= by
    --  norm_num [Nat.add_mod, Nat.mod_mod, Nat.mod_eq_of_lt, Nat.mod_eq_of_lt, Nat.mod_eq_of_lt, Nat.mod_eq_of_lt,
    --      Nat.mod_eq_of_lt, Nat.mod_eq_of_lt] <;>
      rfl
    hole
  --  apply h₁
  norm_num