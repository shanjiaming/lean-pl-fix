theorem positivity_of_square_plus_one (x : ℝ) : 0 < x ^ 2 + 1:=
  by
  have h₁ : 0 ≤ x ^ 2:= by
    --  nlinarith [sq_nonneg x] <;> nlinarith [sq_nonneg x] <;> nlinarith [sq_nonneg x] <;> nlinarith [sq_nonneg x]
    nlinarith
  have h₂ : 0 < x ^ 2 + 1:= by
    have h₂₁ : 0 ≤ x ^ 2 := h₁
    have h₂₂ : 0 < x ^ 2 + 1:= by -- nlinarith
      linarith
    --  exact h₂₂
    linarith
  --  exact h₂
  linarith