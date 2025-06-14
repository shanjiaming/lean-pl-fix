macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem modular_arithmetic : (-3 : ZMod 8) = 5 := by
  have h : (-3 : ZMod 8) = 5 := by
    hole_2
  
  hole_1