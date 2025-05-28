theorem h₃ (N : ℕ) (hN : N = ∑ i ∈ Finset.range 1998, 10 ^ i) (h₁ : N = (10 ^ 1998 - 1) / 9) (h₂ : 10 ^ 1998 > 1) : 10 ^ 1999 > 7 := by -- norm_num [pow_pos] <;> linarith
  norm_num