macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem mathd_numbertheory_229 : 5 ^ 30 % 7 = 1 := by
  have h : 5 ^ 30 % 7 = 1 := by
    hole_2
  
  hole_1