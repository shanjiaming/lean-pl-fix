theorem integral_x_ln_x_over_interval  : ∫ (x : ℝ) in Set.Icc 1 5, x * log x = (25 * log 5 - 12) / 2 := by
  have h₀ : (∫ x in Set.Icc 1 5, x * Real.log x) = (25 * Real.log 5 - 12) / 2 := by sorry
  hole