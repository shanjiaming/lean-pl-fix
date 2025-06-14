macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem solve_equation : r = (7 : ℝ) ↔ given_equation r := by
  have h_main : r = (7 : ℝ) ↔ given_equation r := by
    hole_2
  hole_1