theorem h₁ (x : ℝ) (h : (11 ^ (1 / 4)) ^ (3 * x - 3) = 1 / 5) : 11 ^ (1 / 4) = 1 := by -- norm_num <;> simp [Nat.div_eq_of_lt] <;> norm_num <;> ring_nf <;> norm_num
  hole