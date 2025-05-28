theorem mathd_algebra_113 (x : ℝ) : x ^ 2 - 14 * x + 3 ≥ 7 ^ 2 - 14 * 7 + 3:=
  by
  have h₀ : (x - 7) ^ 2 ≥ 0:= by -- nlinarith [sq_nonneg (x - 7)] <;> linarith
    nlinarith
  have h₁ : x ^ 2 - 14 * x + 3 ≥ 7 ^ 2 - 14 * 7 + 3:=
    by
    have h₂ : x ^ 2 - 14 * x + 3 - (7 ^ 2 - 14 * 7 + 3) = (x - 7) ^ 2:= by -- ring_nf <;> nlinarith
      linarith
    have h₃ : x ^ 2 - 14 * x + 3 - (7 ^ 2 - 14 * 7 + 3) ≥ 0:= by -- linarith
      linarith
    --  linarith
    linarith
  --  exact h₁
  linarith