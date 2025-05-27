theorem h₁ (x : ℝ) (h : f_deriv x = 0) : 6 * x ^ 2 - 6 * x - 36 = 0 := by
  simp [f_deriv, f_deriv_poly, eval_sub, eval_add, eval_mul, eval_pow, eval_C, eval_X] at h ⊢ <;> ring_nf at h ⊢ <;>
    linarith