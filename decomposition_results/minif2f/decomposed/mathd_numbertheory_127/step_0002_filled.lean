theorem h_sum_mod  : (∑ k ∈ Finset.range 101, 2 ^ k) % 7 = 3 := by -- rfl
  norm_num