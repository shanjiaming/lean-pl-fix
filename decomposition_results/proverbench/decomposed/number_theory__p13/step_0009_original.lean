theorem h₃ (d x : ℤ) (hd : d ∣ 5 * x ^ 2 + 1) (h_odd : Odd d) (h_pos : 0 < d) (hd_not_div_five : d % 5 ≠ 0) : d % 2 = 1 := by
  cases' h_odd with k hk
  have this : d % 2 = 1 := by sorry
  exact this