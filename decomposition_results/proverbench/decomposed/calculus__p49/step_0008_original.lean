theorem h₂ (h₁₁ : ∫ (x : ℝ) in Set.Icc (-1) 1, x ^ 2 / (1 + x ^ 2) = ∫ (x : ℝ) in Set.Icc (-1) 1, 1 - 1 / (1 + x ^ 2)) : ∫ (x : ℝ) in Set.Icc (-1) 1, 1 - 1 / (1 + x ^ 2) =
    (∫ (x : ℤ) in Set.Icc (-1) 1, 1) - ∫ (x : ℝ) in Set.Icc (-1) 1, 1 / (1 + x ^ 2) :=
  by
  apply IntegralOn.integral_sub
  · apply Continuous.integrableOn_Icc
    exact continuous_const
  · apply Continuous.integrableOn_Icc
    exact continuous_const.div (continuous_const.add (continuous_pow 2)) (by intro x; nlinarith)