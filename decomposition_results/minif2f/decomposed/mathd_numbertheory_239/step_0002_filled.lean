theorem h_sum  : ∑ k ∈ Finset.Icc 1 12, k = 78 := by -- norm_num [Finset.sum_Icc_succ_top, Nat.div_eq_of_lt] <;> rfl
  norm_cast