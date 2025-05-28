theorem h₂ (N : ℕ) (hN : N = ∑ i ∈ Finset.range 1998, 10 ^ i) (h₁ : N = (10 ^ 1998 - 1) / 9) : 10 ^ 1998 > 1 := by -- norm_num [pow_pos] <;> linarith
  norm_num