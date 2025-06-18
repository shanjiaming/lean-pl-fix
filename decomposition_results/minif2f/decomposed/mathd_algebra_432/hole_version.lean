macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)

theorem mathd_algebra_432 (x : ℝ) : (x + 3) * (2 * x - 6) = 2 * x ^ 2 - 18 := by
  have h_expand : (x + 3) * (2 * x - 6) = 2 * x ^ 2 - 6 * x + 6 * x - 18 := by
    hole_1
  
  have h_simplify : 2 * x ^ 2 - 6 * x + 6 * x - 18 = 2 * x ^ 2 - 18 := by
    have h1 : 2 * x ^ 2 - 6 * x + 6 * x - 18 = 2 * x ^ 2 - 18 := by
      hole_2
    hole_3
  
  have h_final : (x + 3) * (2 * x - 6) = 2 * x ^ 2 - 18 := by
    hole_4
  
  hole_5