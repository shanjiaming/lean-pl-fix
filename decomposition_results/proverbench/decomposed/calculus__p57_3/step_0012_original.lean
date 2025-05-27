theorem h₆ (x✝ x : ℝ) (h₁ : deriv (deriv f) x = (50 * x ^ 2 - 525 * x - 175) / (5 * x ^ 2 + 35) ^ (5 / 2)) (h : (50 * x ^ 2 - 525 * x - 175) / (5 * x ^ 2 + 35) ^ (5 / 2) = 0) (h₂ : 50 * x ^ 2 - 525 * x - 175 = 0) (h₄ : 2 * x ^ 2 - 21 * x - 7 = 0) : x = (21 - √497) / 4 ∨ x = (21 + √497) / 4 :=
  by
  apply or_iff_not_imp_left.mpr
  intro h₇
  apply mul_left_cancel₀ (sub_ne_zero.mpr h₇)
  nlinarith [Real.sq_sqrt (show 0 ≤ 497 by norm_num), Real.sqrt_nonneg 497, sq_nonneg (x - (21 - Real.sqrt 497) / 4)]