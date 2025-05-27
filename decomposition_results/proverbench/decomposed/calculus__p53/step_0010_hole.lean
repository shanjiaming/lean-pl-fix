theorem h₆ (a b : ℝ) (h_a : a = 100) (h_b : b = 200) (h₁ : a = 100) (h₂ : b = 200) (h₅ : ∫ (x : ℝ) in 100 ..200, 4 / (x ^ 2 - 7 * x + 12) = ∫ (x : ℝ) in 100 ..200, 4 / (x - 4) + -4 / (x - 3)) : ∫ (x : ℝ) in 100 ..200, 4 / (x - 4) + -4 / (x - 3) =
    (∫ (x : ℝ) in 100 ..200, 4 / (x - 4)) + ∫ (x : ℝ) in 100 ..200, -4 / (x - 3) :=
  by
  apply intervalIntegral.integral_add
  · apply Continuous.intervalIntegrable
    apply Continuous.div_const
    apply Continuous.div_const
    continuity <;> norm_num <;> linarith
  · apply Continuous.intervalIntegrable
    apply Continuous.div_const
    apply Continuous.div_const
    continuity <;> norm_num <;> linarith
  hole