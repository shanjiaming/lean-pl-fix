theorem h₁ (N : ℕ) (hN : N = ∑ i ∈ Finset.range 1998, 10 ^ i) : N = (10 ^ 1998 - 1) / 9 := by
  rw [hN]
  rw [eq_comm]
  rw [eq_comm]
  rw [eq_comm]
  rw [eq_comm]
  norm_num [Finset.sum_range_succ', pow_succ, Nat.div_eq_of_lt] <;> norm_num <;> rfl <;> decide
  hole