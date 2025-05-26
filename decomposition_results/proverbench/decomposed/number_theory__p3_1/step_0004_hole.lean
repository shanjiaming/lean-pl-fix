theorem h₂ (m : ℕ) : (15 * m + 8) % 5 = 3 := by -- norm_num [Nat.add_mod, Nat.mul_mod, Nat.mod_mod] <;> omega
  hole