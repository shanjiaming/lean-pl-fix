theorem h₂₂ (h₁ : 0 < 4 / 9) (h₂₁ : √2 > 1) : 4 / 9 < 4 * √2 / 9 := by
  nlinarith [Real.sqrt_nonneg 2, Real.sq_sqrt (show 0 ≤ 2 by norm_num)]