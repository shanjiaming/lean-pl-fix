macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem derivative_of_cube_at_four : deriv (fun x : ℝ => x ^ 3) 4 = 48 := by
  have h : deriv (fun x : ℝ => x ^ 3) 4 = 48 := by
    
    hole_2
  
  hole_1