macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem A_squared : A * A = ![![0.6, 0.4, 0.2], ![0.2, 0.2, 0.15], ![0.2, 0.4, 0.65]] := by
  have h₁ : A * A = ![![0.6, 0.4, 0.2], ![0.2, 0.2, 0.15], ![0.2, 0.4, 0.65]] := by
    hole_2
  hole_1