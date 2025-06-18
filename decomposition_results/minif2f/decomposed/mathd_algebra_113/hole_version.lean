macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)

theorem mathd_algebra_113 (x : ℝ) : x ^ 2 - 14 * x + 3 ≥ 7 ^ 2 - 14 * 7 + 3 := by
  have h₀ : (x - 7) ^ 2 ≥ 0 := by
    hole_1
  
  have h₁ : x ^ 2 - 14 * x + 3 ≥ 7 ^ 2 - 14 * 7 + 3 := by
    have h₂ : x ^ 2 - 14 * x + 3 - (7 ^ 2 - 14 * 7 + 3) = (x - 7) ^ 2 := by
      hole_2
    have h₃ : x ^ 2 - 14 * x + 3 - (7 ^ 2 - 14 * 7 + 3) ≥ 0 := by
      hole_3
    hole_4
  
  hole_5