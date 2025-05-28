theorem mathd_numbertheory_551 : 1529 % 6 = 5:=
  by
  have h : 1529 % 6 = 5:= by
    --  norm_num [Nat.add_mod, Nat.mul_mod, Nat.mod_mod, Nat.mod_eq_of_lt] <;> rfl <;> norm_num <;> rfl
    norm_num
  --  exact h
  norm_num