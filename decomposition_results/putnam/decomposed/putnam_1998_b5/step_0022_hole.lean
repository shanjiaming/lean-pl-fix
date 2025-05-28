theorem h₆₆₃ (N : ℕ) (hN : N = ∑ i ∈ Finset.range 1998, 10 ^ i) (h₁ : N = (10 ^ 1998 - 1) / 9) (h₂ : 10 ^ 1998 > 1) (h₃ : 10 ^ 1999 > 7) (h₄ : 10 ^ 1998 - 1 > 0) (h₅ : ↑N = (10 ^ 1998 - 1) / 9) (h₆₁ : 0 < 10 ^ 1998 - 1) (h₆₂ : 0 < 10 ^ 1000) (h₆₃ : 0 < 10 ^ 1998) (h₆₄ : 0 < 10 ^ 1999) (h₆₅ : 0 < √↑N) : √((10 ^ 1998 - 1) / 9) < 10 ^ 999 :=
  by
  --  rw [Real.sqrt_lt (by positivity)]
  ·
    have h₆₆₄ : ((10 : ℝ) ^ 999 : ℝ) > 0 := by sorry
  --    nlinarith [sq_nonneg ((10 : ℝ) ^ 999 - 1 : ℝ)]
  --  · positivity
  hole