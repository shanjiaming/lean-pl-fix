macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem complex_power_example : (1 + I)^10 = 32 * I := by
  have h1 : (1 + I) ^ 2 = 2 * I := by
    hole_2
  
  have h2 : (1 + I) ^ 4 = -4 := by
    hole_3
  
  have h3 : (1 + I) ^ 8 = 16 := by
    hole_4
  
  have h4 : (1 + I) ^ 10 = 32 * I := by
    hole_5
  
  hole_1