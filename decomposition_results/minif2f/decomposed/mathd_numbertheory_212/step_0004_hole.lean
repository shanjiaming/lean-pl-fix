theorem h3 (h1 : 16 ^ 17 % 10 = 6) (h2 : 17 ^ 18 % 10 = 9) : 18 ^ 19 % 10 = 2 := by -- norm_num [pow_succ, Nat.mul_mod, Nat.pow_mod, Nat.mod_mod] <;> rfl
  hole