theorem h₁₂ (h₁₁ : √65 = √(5 * 13)) : √(5 * 13) = √5 * √13 :=
  by
  rw [Real.sqrt_eq_iff_sq_eq (by positivity) (by positivity)]
  nlinarith [Real.sqrt_nonneg 5, Real.sqrt_nonneg 13, Real.sq_sqrt (show 0 ≤ 5 by norm_num),
    Real.sq_sqrt (show 0 ≤ 13 by norm_num)]