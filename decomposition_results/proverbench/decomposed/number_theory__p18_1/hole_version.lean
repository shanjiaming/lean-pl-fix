macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem particular_solution : ∃ m n : Int, 7 * m + 12 * n = 22 := by
  have h_main : ∃ (m n : Int), 7 * m + 12 * n = 22 := by
    hole_2
  
  hole_1