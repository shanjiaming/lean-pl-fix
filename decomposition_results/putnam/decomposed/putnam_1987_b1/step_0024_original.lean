theorem h₂₁ (h₆ : ∀ x ∈ Set.Icc 2 4, Real.log (9 - x) > 0) (h₇ : ∀ x ∈ Set.Icc 2 4, Real.log (x + 3) > 0) (h₁₁ : ∫ (x : ℝ) in 2 ..4, 1 = 2) (h₁₂ :  ∫ (x : ℝ) in 2 ..4,      √(Real.log (9 - x)) / (√(Real.log (9 - x)) + √(Real.log (x + 3))) +        √(Real.log (x + 3)) / (√(Real.log (9 - x)) + √(Real.log (x + 3))) =    2) : ∫ (x : ℝ) in 2 ..4,
      √(Real.log (9 - x)) / (√(Real.log (9 - x)) + √(Real.log (x + 3))) +
        √(Real.log (x + 3)) / (√(Real.log (9 - x)) + √(Real.log (x + 3))) =
    ∫ (x : ℝ) in 2 ..4,
      √(Real.log (9 - x)) / (√(Real.log (9 - x)) + √(Real.log (x + 3))) +
        ∫ (x : ℝ) in 2 ..4, √(Real.log (x + 3)) / (√(Real.log (9 - x)) + √(Real.log (x + 3))) :=
  by
  apply intervalIntegral.integral_add
  · apply Continuous.intervalIntegrable
    apply Continuous.div
    · apply Real.continuous_sqrt.comp (Real.continuous_log.comp (continuous_const.sub continuous_id))
    · apply Continuous.add
      · apply Real.continuous_sqrt.comp (Real.continuous_log.comp (continuous_const.sub continuous_id))
      · apply Real.continuous_sqrt.comp (Real.continuous_log.comp (continuous_id.add continuous_const))
    · intro x
      have h₂₂ : Real.sqrt (Real.log (9 - x)) + Real.sqrt (Real.log (x + 3)) > 0 :=
        by
        have h₂₃ : Real.sqrt (Real.log (9 - x)) > 0 :=
          Real.sqrt_pos.mpr
            (h₆ x
              ⟨by linarith [Set.mem_Icc.mp (by norm_num : (x : ℝ) ∈ Set.Icc 2 4)], by
                linarith [Set.mem_Icc.mp (by norm_num : (x : ℝ) ∈ Set.Icc 2 4)]⟩)
        have h₂₄ : Real.sqrt (Real.log (x + 3)) > 0 :=
          Real.sqrt_pos.mpr
            (h₇ x
              ⟨by linarith [Set.mem_Icc.mp (by norm_num : (x : ℝ) ∈ Set.Icc 2 4)], by
                linarith [Set.mem_Icc.mp (by norm_num : (x : ℝ) ∈ Set.Icc 2 4)]⟩)
        linarith
      positivity
  · apply Continuous.intervalIntegrable
    apply Continuous.div
    · apply Real.continuous_sqrt.comp (Real.continuous_log.comp (continuous_id.add continuous_const))
    · apply Continuous.add
      · apply Real.continuous_sqrt.comp (Real.continuous_log.comp (continuous_const.sub continuous_id))
      · apply Real.continuous_sqrt.comp (Real.continuous_log.comp (continuous_id.add continuous_const))
    · intro x
      have h₂₅ : Real.sqrt (Real.log (9 - x)) + Real.sqrt (Real.log (x + 3)) > 0 :=
        by
        have h₂₆ : Real.sqrt (Real.log (9 - x)) > 0 :=
          Real.sqrt_pos.mpr
            (h₆ x
              ⟨by linarith [Set.mem_Icc.mp (by norm_num : (x : ℝ) ∈ Set.Icc 2 4)], by
                linarith [Set.mem_Icc.mp (by norm_num : (x : ℝ) ∈ Set.Icc 2 4)]⟩)
        have h₂₇ : Real.sqrt (Real.log (x + 3)) > 0 :=
          Real.sqrt_pos.mpr
            (h₇ x
              ⟨by linarith [Set.mem_Icc.mp (by norm_num : (x : ℝ) ∈ Set.Icc 2 4)], by
                linarith [Set.mem_Icc.mp (by norm_num : (x : ℝ) ∈ Set.Icc 2 4)]⟩)
        linarith
      positivity