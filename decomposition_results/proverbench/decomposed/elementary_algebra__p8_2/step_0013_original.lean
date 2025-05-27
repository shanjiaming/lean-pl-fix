theorem h₃₄ (h₁ : (√5 * √13) ^ 2 = 65) (h₂ : √65 ^ 2 = 65) (h₃₁ : 0 ≤ √5 * √13) (h₃₂ : 0 ≤ √65) (h₃₃ : (√5 * √13) ^ 2 = √65 ^ 2) : √5 * √13 = √65 := by
  nlinarith [Real.sq_sqrt (show 0 ≤ 5 by norm_num), Real.sq_sqrt (show 0 ≤ 13 by norm_num),
    Real.sq_sqrt (show 0 ≤ 65 by norm_num), Real.sqrt_nonneg 5, Real.sqrt_nonneg 13, Real.sqrt_nonneg 65]