theorem h₁  : 29 ^ 13 % 7 = 1 := by -- norm_num [Nat.pow_mod, Nat.mod_mod, Nat.mod_eq_of_lt, show 2 ≤ 7 by -- norm_num] <;> rfl
  hole