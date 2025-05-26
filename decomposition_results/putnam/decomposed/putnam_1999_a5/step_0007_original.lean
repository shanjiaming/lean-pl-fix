theorem h₅ (p : Polynomial ℝ) (hpdeg : p.degree = 1999) (h₃ : p ≠ 0) : ∫ (x : ℝ) in -1 ..1, ‖Polynomial.eval x p‖ ≥
    ∫ (x : ℝ) in -1 ..1, if Polynomial.eval 0 p ≥ 0 then Polynomial.eval x p else -Polynomial.eval x p :=
  by
  refine' intervalIntegral.integral_mono_on real.pi_pos.le _ _ _
  · exact Continuous.intervalIntegrable (Continuous.comp continuous_norm (Polynomial.continuous _))
  ·
    exact
      Continuous.intervalIntegrable
        (by
          by_cases h₅ : (p.eval 0 : ℝ) ≥ 0
          · simpa [h₅] using Continuous.continuousOn (Polynomial.continuous _)
          · simpa [h₅] using Continuous.continuousOn (Continuous.neg (Polynomial.continuous _)))
  · intro x _
    by_cases h₅ : (p.eval 0 : ℝ) ≥ 0
    ·
      simp_all [abs_of_nonneg, abs_of_nonpos, le_of_lt] <;>
                norm_num [abs_mul, abs_of_nonneg, abs_of_nonpos, le_of_lt] <;>
              cases' le_total 0 (p.eval x) with h₆ h₆ <;>
            cases' le_total 0 (p.eval 0) with h₇ h₇ <;>
          simp_all [abs_of_nonneg, abs_of_nonpos, le_of_lt] <;>
        nlinarith
    ·
      simp_all [abs_of_nonneg, abs_of_nonpos, le_of_lt] <;>
                norm_num [abs_mul, abs_of_nonneg, abs_of_nonpos, le_of_lt] <;>
              cases' le_total 0 (p.eval x) with h₆ h₆ <;>
            cases' le_total 0 (p.eval 0) with h₇ h₇ <;>
          simp_all [abs_of_nonneg, abs_of_nonpos, le_of_lt] <;>
        nlinarith