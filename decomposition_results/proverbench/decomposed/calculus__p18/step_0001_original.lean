theorem integral_of_function_equals_ln_plus_168  : ∫ (x : ℝ) in Set.Icc 2 8, 1 / x + x ^ 2 = Real.log 4 + 168 :=
  by
  have h_main : (∫ x in Set.Icc 2 8, (1 / x + x ^ 2 : ℝ)) = Real.log 4 + 168 := by sorry
  exact h_main