macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)

theorem mathd_numbertheory_342 : 54 % 6 = 0 := by
  have h : 54 % 6 = 0 := by
    hole_1
  
  hole_2