theorem integral_of_one_over_x_squared_plus_one (x : ℝ) : ∫ (y : ℝ) in Set.Icc 0 x, 1 / (y ^ 2 + 1) = arctan x - arctan 0 :=
  by
  have h_main : ∫ y in Set.Icc 0 x, (1 : ℝ) / (y ^ 2 + 1) = arctan x - arctan 0 := by sorry
  --  exact h_main
  hole