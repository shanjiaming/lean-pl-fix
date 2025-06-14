macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem det_identity : det (1 : Matrix n n ℝ) = 1 := by
  have h : det (1 : Matrix n n ℝ) = 1 := by
    
    hole_2
  
  hole_1