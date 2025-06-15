macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem T_value (x y : ℤ) : T (x, y) = 3 * x - 5 * y := by
  have h : T (x, y) = 3 * x - 5 * y := by
    
    hole_2
  
  
  hole_1