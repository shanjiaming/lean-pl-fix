macro "hole_3" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem second_derivative_test (x : ℝ) (h : f_deriv x = 0) :
  (x = 2 ∧ f_second_deriv x < 0) ∨ (x = 4 ∧ f_second_deriv x > 0) := by
  have h_cases : x = 2 ∨ x = 4 := by
    have h₁ : f_deriv x = 0 ↔ x = 2 ∨ x = 4 := critical_points x
    have h₂ : x = 2 ∨ x = 4 := by
      hole_3
    hole_2
  
  have h_main : (x = 2 ∧ f_second_deriv x < 0) ∨ (x = 4 ∧ f_second_deriv x > 0) := by
    hole_4
  
  hole_1