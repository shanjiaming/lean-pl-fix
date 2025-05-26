theorem integral_of_rational_function_over_interval  : ∫ (x : ℝ) in Set.Icc (-1) 1, x ^ 2 / (1 + x ^ 2) = 2 - π / 2 :=
  by
  have h_main : (∫ x in Set.Icc (-1) 1, (x ^ 2 / (1 + x ^ 2 : ℝ))) = 2 - π / 2 := by sorry
  --  exact h_main
  hole