theorem second_derivative_test (x✝ x : ℝ) (h : f_deriv x = 0) : x = 2 ∧ f_second_deriv x < 0 ∨ x = 4 ∧ f_second_deriv x > 0 :=
  by
  have h_cases : x = 2 ∨ x = 4 := by sorry
  have h_main : (x = 2 ∧ f_second_deriv x < 0) ∨ (x = 4 ∧ f_second_deriv x > 0) := by sorry
  exact h_main
  hole