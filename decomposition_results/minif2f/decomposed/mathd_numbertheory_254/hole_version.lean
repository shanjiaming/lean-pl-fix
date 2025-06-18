macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)

theorem mathd_numbertheory_254 : (239 + 174 + 83) % 10 = 6 := by
  have h₁ : (239 + 174 + 83) % 10 = 6 := by
    hole_1
  
  hole_2