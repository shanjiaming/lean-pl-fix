theorem integral_ln_sin_pi_over_two (x : ℝ) : ∫ (x : ℝ) in Set.Icc 0 (π / 2), log (sin x) = -(π / 2) * log 2 :=
  by
  have h_main : (∫ x in Set.Icc 0 (π / 2), Real.log (Real.sin x)) = -(π / 2) * Real.log 2 := by sorry
  --  exact h_main
  linarith