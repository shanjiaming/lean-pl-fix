theorem simplify_LHS_numerator : 2 * sqrt 13 - 5 * sqrt 65 = (2 - 5 * sqrt 5) * sqrt 13:=
  by
  have h1 : (2 - 5 * sqrt 5) * sqrt 13 = 2 * sqrt 13 - 5 * sqrt 5 * sqrt 13:= by
    --  ring_nf <;>
    --    nlinarith [Real.sqrt_nonneg 5, Real.sqrt_nonneg 13, Real.sq_sqrt (show 0 ≤ 5 by norm_num),
    --      Real.sq_sqrt (show 0 ≤ 13 by norm_num)]
    hole
  have h2 : 2 * sqrt 13 - 5 * sqrt 5 * sqrt 13 = 2 * sqrt 13 - 5 * sqrt 65:=
    by
    have h2₁ : sqrt 5 * sqrt 13 = sqrt 65 := sqrt_five_times_sqrt_thirteen
    have h2₂ : 5 * sqrt 5 * sqrt 13 = 5 * (sqrt 5 * sqrt 13) := by ring
    rw [h2₂, h2₁] <;> ring_nf <;> simp [sqrt_five_times_sqrt_thirteen] <;> ring_nf <;>
      linarith [Real.sqrt_nonneg 5, Real.sqrt_nonneg 13, Real.sqrt_nonneg 65]
    hole
  have h3 : 2 * sqrt 13 - 5 * sqrt 65 = 2 * sqrt 13 - 5 * sqrt 65:= by -- rfl
    hole
  have h4 : (2 - 5 * sqrt 5) * sqrt 13 = 2 * sqrt 13 - 5 * sqrt 65:=
    by
    --  rw [h1]
    rw [h2] <;> linarith [Real.sqrt_nonneg 5, Real.sqrt_nonneg 13, Real.sqrt_nonneg 65]
    hole
  have h5 : 2 * sqrt 13 - 5 * sqrt 65 = (2 - 5 * sqrt 5) * sqrt 13:= by -- linarith
    hole
  --  rw [h5] <;> linarith
  hole