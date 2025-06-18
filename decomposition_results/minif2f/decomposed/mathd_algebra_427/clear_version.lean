macro "hole_3" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "skip_hole" : term => `(sorry)

theorem mathd_algebra_427 (x y z : ℝ) (h₀ : 3 * x + y = 17) (h₁ : 5 * y + z = 14)
    (h₂ : 3 * x + 5 * z = 41) : x + y + z = 12 := by
  have h₃ : 6 * x + 6 * y + 6 * z = 72 := by
    have h₃₁ : 6 * x + 6 * y + 6 * z = (3 * x + y) + (5 * y + z) + (3 * x + 5 * z) := by
      hole_3
    hole_2
  
  have h₄ : x + y + z = 12 := by
    have h₄₁ : x + y + z = (6 * x + 6 * y + 6 * z) / 6 := by
      hole_5
    hole_4
  
  hole_1