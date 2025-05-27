theorem h₅₂ (P : ℝ[X]) (h : ∀ (x : ℝ), eval x P ^ 2 - 1 = 4 * eval (x ^ 2 - 4 * x + 1) P) (h_constant h₁ : P.degree ≤ 0) (c : ℝ) (hc : P = C c) (h₃ : ∀ (x : ℝ), eval x P = c) (h₄ h₅₁ : c ^ 2 - 1 = 4 * c) : c = 2 + √5 ∨ c = 2 - √5 :=
  by
  apply or_iff_not_imp_left.mpr
  intro h₅₃
  apply mul_left_cancel₀ (sub_ne_zero.mpr h₅₃)
  nlinarith [Real.sqrt_nonneg 5, Real.sq_sqrt (show 0 ≤ 5 by norm_num), sq_nonneg (c - (2 + Real.sqrt 5)),
    sq_nonneg (c - (2 - Real.sqrt 5))]