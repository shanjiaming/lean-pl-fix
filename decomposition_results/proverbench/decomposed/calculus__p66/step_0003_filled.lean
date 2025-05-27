theorem h₁  : ∫ (x : ℝ) in Set.Icc 1 5, x * log x = ∫ (x : ℝ) in 1 ..5, x * log x := by
  simp [intervalIntegral.integral_congr] <;> simp_all [Set.Icc, Real.volume_Icc, Real.volume_Icc, Real.volume_Icc] <;>
      norm_num <;>
    linarith [Real.log_pos (by norm_num : (1 : ℝ) < 5)]
  hole