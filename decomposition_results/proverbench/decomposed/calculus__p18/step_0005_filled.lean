theorem h₁₂ (h₁₁ : ∫ (x : ℝ) in Set.Icc 2 8, 1 / x + x ^ 2 = ∫ (x : ℝ) in Set.Icc 2 8, 1 / x + x ^ 2) : ∫ (x : ℝ) in Set.Icc 2 8, 1 / x + x ^ 2 = (∫ (x : ℝ) in Set.Icc 2 8, 1 / x) + ∫ (x : ℝ) in Set.Icc 2 8, x ^ 2 :=
  by
  --  apply Integral.add
  · apply ContinuousOn.integrableOn_Icc
    exact ContinuousOn.div continuousOn_const continuousOn_id fun x hx => by norm_num at hx ⊢ <;> linarith
  · apply ContinuousOn.integrableOn_Icc
    exact continuousOn_pow 2
  hole