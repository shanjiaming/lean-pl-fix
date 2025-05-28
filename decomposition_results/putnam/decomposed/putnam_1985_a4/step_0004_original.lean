theorem h_a3 (a : ℕ → ℕ) (ha1 : a 1 = 3) (ha : ∀ i ≥ 1, a (i + 1) = 3 ^ a i) (h_a2 : a 2 = 27) : a 3 % 100 = 87 :=
  by
  have h1 : a 3 = 3 ^ a 2 := by sorry
  rw [h1, h_a2] <;> norm_num [pow_succ, Nat.mul_mod, Nat.pow_mod, Nat.mod_mod] <;> rfl