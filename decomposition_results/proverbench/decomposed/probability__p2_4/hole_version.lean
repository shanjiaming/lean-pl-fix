macro "hole_3" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem probability_location_2 : (A * (A * (A * X0))) 1 0 = 0.18 := by
  have h_main : (A * (A * (A * X0))) 1 0 = 0.18 := by
    have h₁ : A * (A * (A * X0)) = ![![0.38], ![0.18], ![0.44]] := by
      hole_3
    hole_2
  
  hole_1