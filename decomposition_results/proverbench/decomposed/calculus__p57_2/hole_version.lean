macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem f_second_deriv (x : ℝ) : deriv (deriv f) x = (50 * x^2 - 525 * x - 175) / ((5 * x^2 + 35)^(5/2)) := by
  have h₁ : deriv (deriv f) x = (50 * x^2 - 525 * x - 175) / ((5 * x^2 + 35)^2) := by
    hole_2
  
  have h₂ : ((5 * x^2 + 35) : ℝ)^(5/2) = (5 * x^2 + 35)^2 := by
    hole_3
  
  have h₃ : deriv (deriv f) x = (50 * x^2 - 525 * x - 175) / ((5 * x^2 + 35)^(5/2)) := by
    hole_4
  
  hole_1