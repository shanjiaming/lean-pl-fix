macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)

theorem mathd_algebra_176 (x : ℝ) : (x + 1) ^ 2 * x = x ^ 3 + 2 * x ^ 2 + x := by
  have h1 : (x + 1) ^ 2 * x = (x ^ 2 + 2 * x + 1) * x := by
    have h1₁ : (x + 1) ^ 2 = x ^ 2 + 2 * x + 1 := by
      hole_1
    hole_2
  
  have h2 : (x ^ 2 + 2 * x + 1) * x = x ^ 3 + 2 * x ^ 2 + x := by
    have h2₁ : (x ^ 2 + 2 * x + 1) * x = x ^ 3 + 2 * x ^ 2 + x := by
      hole_3
    hole_4
  
  have h3 : (x + 1) ^ 2 * x = x ^ 3 + 2 * x ^ 2 + x := by
    hole_5
  
  hole_6