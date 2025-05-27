theorem integral_of_inv_sq_plus_one (x C : ℝ) : ∫ (x : ℝ), f x = arctan x + C :=
  by
  have h_hyp : C = (∫ x, f x) - arctan x := by sorry
  have h_main : (∫ x, f x) = arctan x + C := by sorry
  exact h_main