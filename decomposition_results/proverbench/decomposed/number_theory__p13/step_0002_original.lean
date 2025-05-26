theorem hd_not_div_five (d x : ℤ) (hd : d ∣ 5 * x ^ 2 + 1) (h_odd : Odd d) (h_pos : 0 < d) : d % 5 ≠ 0 := by
  intro h
  have h₁ : (5 : ℤ) ∣ d := by sorry
  have h₂ : (5 : ℤ) ∣ 5 * x ^ 2 + 1 := by sorry
  have h₃ : (5 : ℤ) ∣ 1 := by sorry
  omega