macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem f_zero_ne_zero : eval (0 : ZMod 2) f ≠ 0 := by
  have h : eval (0 : ZMod 2) f = 1 := by
    hole_2
  
  have h₁ : eval (0 : ZMod 2) f ≠ 0 := by
    hole_3
  
  hole_1