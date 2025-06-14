theorem f_initial_condition (u : ℝ) :
  f u 0 = u^2 * exp (-u) := by
  have h₁ : f u 0 = (u^2 + 0^2 : ℝ) * exp (-(u + 0)) := by
    admit
  
  have h₂ : f u 0 = u^2 * exp (-u) := by
    admit