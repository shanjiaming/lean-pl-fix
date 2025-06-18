macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "skip_hole" : term => `(sorry)

theorem mathd_numbertheory_342 : 54 % 6 = 0 := by
  have h : 54 % 6 = 0 := by
    hole_2
  
  hole_1