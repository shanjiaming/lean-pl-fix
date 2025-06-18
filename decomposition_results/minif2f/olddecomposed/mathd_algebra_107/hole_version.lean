macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem mathd_algebra_107 (x y : ℝ) (h₀ : x ^ 2 + 8 * x + y ^ 2 - 6 * y = 0) :
    (x + 4) ^ 2 + (y - 3) ^ 2 = 5 ^ 2 := by
  have h₁ : (x + 4) ^ 2 + (y - 3) ^ 2 = x ^ 2 + 8 * x + y ^ 2 - 6 * y + 25 := by
    hole_2
  
  have h₂ : (x + 4) ^ 2 + (y - 3) ^ 2 = 25 := by
    hole_3
  
  have h₃ : (x + 4) ^ 2 + (y - 3) ^ 2 = 5 ^ 2 := by
    hole_4
  
  hole_1