macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem mathd_numbertheory_728 : (29 ^ 13 - 5 ^ 13) % 7 = 3 := by
  have h₁ : 29 ^ 13 % 7 = 1 := by
    hole_2
  
  have h₂ : 5 ^ 13 % 7 = 5 := by
    hole_3
  
  have h₃ : (29 ^ 13 - 5 ^ 13) % 7 = 3 := by
    have h₄ : (29 ^ 13 - 5 ^ 13) % 7 = 3 := by
      hole_5
    hole_4
  
  hole_1