theorem second_derivative_test (x : ℝ) (h : f_deriv x = 0) :
  (x = 2 ∧ f_second_deriv x < 0) ∨ (x = 4 ∧ f_second_deriv x > 0) := by
  have h_cases : x = 2 ∨ x = 4 := by
    have h₁ : f_deriv x = 0 ↔ x = 2 ∨ x = 4 := critical_points x
    have h₂ : x = 2 ∨ x = 4 := by
      admit
    admit
  
  have h_main : (x = 2 ∧ f_second_deriv x < 0) ∨ (x = 4 ∧ f_second_deriv x > 0) := by
    admit
  
  admit