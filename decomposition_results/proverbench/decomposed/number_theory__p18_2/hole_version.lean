macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem general_solution (k : Int) : ∃ m n : Int, m = -110 + 12 * k ∧ n = 66 - 7 * k ∧ 7 * m + 12 * n = 22 := by
  have h_main : ∃ (m n : Int), m = -110 + 12 * k ∧ n = 66 - 7 * k ∧ 7 * m + 12 * n = 22 := by
    hole_2
  
  hole_1