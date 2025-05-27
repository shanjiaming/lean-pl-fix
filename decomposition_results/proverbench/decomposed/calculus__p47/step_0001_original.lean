theorem integral_of_integrand2  : ∃ F, ∀ (x : ℝ), deriv F x = integrand x ∧ F x = 1 / 2 * Real.log (x ^ 2 + 1) + sorry :=
  by
  have h_main : ∃ (F : ℝ → ℝ), ∀ (x : ℝ), deriv F x = integrand x ∧ F x = (1 / 2) * Real.log (x ^ 2 + 1) + C := by sorry
  exact h_main