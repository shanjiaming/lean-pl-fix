theorem h_main (i : ℕ) (hi : i ∈ S) (h : i = 0 ∨ i = 1 ∨ i = 2 ∨ i = 3) : 2 ^ i = Q ↑i := by
  --  rcases h with (rfl | rfl | rfl | rfl)
  --  · norm_num [Q, pow_zero, pow_one, pow_two, pow_three] <;> ring_nf <;> norm_num
  --  · norm_num [Q, pow_zero, pow_one, pow_two, pow_three] <;> ring_nf <;> norm_num
  --  · norm_num [Q, pow_zero, pow_one, pow_two, pow_three] <;> ring_nf <;> norm_num
  --  · norm_num [Q, pow_zero, pow_one, pow_two, pow_three] <;> ring_nf <;> norm_num
  hole