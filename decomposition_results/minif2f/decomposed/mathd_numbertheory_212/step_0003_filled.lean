theorem h2 (h1 : 16 ^ 17 % 10 = 6) : 17 ^ 18 % 10 = 9 := by -- norm_num [pow_succ, Nat.mul_mod, Nat.pow_mod, Nat.mod_mod] <;> rfl
  norm_num