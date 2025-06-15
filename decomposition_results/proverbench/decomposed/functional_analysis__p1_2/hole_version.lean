macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem f_initial_condition (u : ℝ) :
  f u 0 = u^2 * exp (-u) := by
  have h₁ : f u 0 = (u^2 + 0^2 : ℝ) * exp (-(u + 0)) := by
    hole_2
  
  have h₂ : f u 0 = u^2 * exp (-u) := by
    hole_3