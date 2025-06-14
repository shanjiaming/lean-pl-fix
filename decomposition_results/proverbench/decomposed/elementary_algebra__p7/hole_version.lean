macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem function_composition_example :
    f_at (g_at_7.eval (5 : ℤ)) (h_at_5.eval (4 : ℤ)) = 125 := by
  have h₁ : g_at_7.eval (5 : ℤ) = 55 := by
    hole_2
  
  have h₂ : h_at_5.eval (4 : ℤ) = 20 := by
    hole_3
  
  have h₃ : f_at (g_at_7.eval (5 : ℤ)) (h_at_5.eval (4 : ℤ)) = 125 := by
    hole_4
  
  hole_1