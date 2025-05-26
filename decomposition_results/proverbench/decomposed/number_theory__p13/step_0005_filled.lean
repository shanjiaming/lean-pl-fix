theorem h₃ (d x : ℤ) (hd : d ∣ 5 * x ^ 2 + 1) (h_odd : Odd d) (h_pos : 0 < d) (h : d % 5 = 0) (h₁ : 5 ∣ d) (h₂ : 5 ∣ 5 * x ^ 2 + 1) : 5 ∣ 1 := by -- omega
  omega