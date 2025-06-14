macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem mathd_numbertheory_769 : (129 ^ 34 + 96 ^ 38) % 11 = 9 := by
  have h1 : (129 ^ 34 + 96 ^ 38) % 11 = 9 := by
    hole_2
  hole_1