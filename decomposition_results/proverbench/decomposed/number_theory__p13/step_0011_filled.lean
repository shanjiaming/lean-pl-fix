theorem h₄ (d x : ℤ) (hd : d ∣ 5 * x ^ 2 + 1) (h_odd : Odd d) (h_pos : 0 < d) (hd_not_div_five : d % 5 ≠ 0) (h₃ : d % 2 = 1) : d % 5 ≠ 0 := by -- simpa using hd_not_div_five
  omega