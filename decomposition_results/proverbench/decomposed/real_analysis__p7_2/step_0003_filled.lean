theorem h₃ (x✝ x : ℝ) (h₂ : f x = (8 * x - x ^ 2) ^ (1 / 3)) : 1 / 3 = 0 := by
  norm_num <;> simp [Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_ofNat] <;> norm_num
  hole