macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem composition_of_sine_and_quadratic (x : ℝ) : u (v x) = Real.sin (x ^ 2) := by
  have h₁ : u (v x) = Real.sin (x ^ 2) := by
    hole_2
  hole_1