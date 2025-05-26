theorem h₁ (d x : ℤ) (hd : d ∣ 5 * x ^ 2 + 1) (h_odd : Odd d) (h_pos : 0 < d) (h : d % 5 = 0) : 5 ∣ d := by -- omega
  omega