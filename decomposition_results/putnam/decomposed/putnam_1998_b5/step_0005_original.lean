theorem h₄ (N : ℕ) (hN : N = ∑ i ∈ Finset.range 1998, 10 ^ i) (h₁ : N = (10 ^ 1998 - 1) / 9) (h₂ : 10 ^ 1998 > 1) (h₃ : 10 ^ 1999 > 7) : 10 ^ 1998 - 1 > 0 :=
  by
  have h₄₁ : (10 : ℝ) ^ 1998 > 1 := by sorry
  linarith