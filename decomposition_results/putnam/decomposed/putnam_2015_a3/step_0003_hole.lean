theorem h₁  : ∏ a, ∏ b, (1 + Complex.exp (2 * (↑π : ℂ) * Complex.I * ((↑(↑a : ℕ) : ℂ) + 1) * ((↑(↑b : ℕ) : ℂ) + 1) / 2015)) ≠ 0 :=
  by
  --  by_contra h
  --  simp_all [Complex.ext_iff, Complex.exp_re, Complex.exp_im, Complex.log_re, Complex.log_im, Real.log_pos,
  --            Real.log_lt_log_iff, Real.log_exp, Real.log_pow, Real.log_mul, Real.log_div, Real.log_rpow, Real.log_sqrt,
  --            Real.log_inv, Real.log_one, Real.log_zero, Real.log_neg_eq_log] <;>
  --          norm_num at * <;>
  --        ring_nf at * <;>
  --      norm_num at * <;>
  --    linarith [Real.pi_pos]
  hole