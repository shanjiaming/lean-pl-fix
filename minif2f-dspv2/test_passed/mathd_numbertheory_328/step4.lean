theorem h3 (h1 : 5 ^ 6 % 7 = 1) (h2 : 999999 = 6 * 166666 + 3) : 5 ^ 999999 % 7 = 6 := by
  rw [h2]
  rw [show 5 ^ (6 * 166666 + 3) = (5 ^ 6) ^ 166666 * 5 ^ 3 by rw [pow_add, pow_mul] <;> ring_nf]
  rw [show ((5 ^ 6) ^ 166666 * 5 ^ 3) % 7 = ((5 ^ 6 % 7) ^ 166666 * (5 ^ 3 % 7)) % 7 by
      simp [Nat.pow_mod, Nat.mul_mod, Nat.pow_add, Nat.pow_mul, Nat.mod_mod]]
  rw [h1]
  norm_num <;> rfl