theorem h₅ (p : ℕ) (h₂ : 15 * (7 * p) + 8 = 105 * p + 8) (h₄ : p % 7 = p % 7) : (105 * p + 8) % 7 = 1 := by -- norm_num [Nat.add_mod, Nat.mul_mod, Nat.mod_mod, Nat.mod_eq_of_lt]
  omega