macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)

theorem mathd_numbertheory_551 : 1529 % 6 = 5 := by
  have h : 1529 % 6 = 5 := by
    hole_1
  hole_2