theorem h_base (n : ℕ) (hn : n > 0) : 1 / 2 = ∑ i ∈ Finset.range 1, (↑((1 + i - 1).choose i) : ℚ) * 2 ^ (-1 - (↑i : ℤ)) := by
  --  norm_num [Finset.sum_range_succ, Nat.choose_zero_right, Nat.choose_one_right] <;>
                  simp_all [Finset.sum_range_succ, Nat.choose_zero_right, Nat.choose_one_right] <;>
                norm_num <;>
              simp_all [Finset.sum_range_succ, Nat.choose_zero_right, Nat.choose_one_right] <;>
            norm_num <;>
          simp_all [Finset.sum_range_succ, Nat.choose_zero_right, Nat.choose_one_right] <;>
        norm_num <;>
      simp_all [Finset.sum_range_succ, Nat.choose_zero_right, Nat.choose_one_right] <;>
    norm_num
  hole