macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem value_at_pi_over_3 : f (π / 3) = 4 := by
  have h_cos : cos (π / 3) = 1 / 2 := by
    hole_2
  
  have h_main : f (π / 3) = 4 := by
    hole_3
  
  hole_1