macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem det_A : det A = -32 := by
  have h₀ : det A = -32 := by
    hole_2
  
  hole_1