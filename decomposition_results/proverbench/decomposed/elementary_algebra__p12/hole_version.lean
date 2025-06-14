macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem function_composition_result : (g_poly.eval ((f_poly 6).eval 7)) = 595 := by
  have h1 : (f_poly 6).eval 7 = 120 := by
    
    hole_2
  
  have h2 : g_poly.eval ((f_poly 6).eval 7) = 595 := by
    hole_3
  
  hole_1