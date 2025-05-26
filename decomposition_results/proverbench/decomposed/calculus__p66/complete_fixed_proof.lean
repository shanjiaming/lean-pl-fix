theorem integral_x_ln_x_over_interval : ∫ x in Set.Icc 1 5, x * Real.log x = (25 * Real.log 5 - 12) / 2:= by
  have h₀ : (∫ x in Set.Icc 1 5, x * Real.log x) = (25 * Real.log 5 - 12) / 2:=
    by
    have h₁ : ∫ x in Set.Icc 1 5, x * Real.log x = ∫ x in (1 : ℝ)..5, x * Real.log x:= by
      simp [intervalIntegral.integral_congr] <;> simp_all [Set.Icc, Real.volume_Icc, Real.volume_Icc, Real.volume_Icc] <;>
          norm_num <;>
        linarith [Real.log_pos (by norm_num : (1 : ℝ) < 5)]
      hole
    --  rw [h₁]
    have h₂ : ∫ x in (1 : ℝ)..5, x * Real.log x = (25 * Real.log 5 - 12) / 2:= by
      have h₃ :
        ∫ x in (1 : ℝ)..5, x * Real.log x =
          ((5 : ℝ) ^ 2 / 2 * Real.log 5 - (5 : ℝ) ^ 2 / 4) - ((1 : ℝ) ^ 2 / 2 * Real.log 1 - (1 : ℝ) ^ 2 / 4) := by sorry
      hole
    linarith
  linarith