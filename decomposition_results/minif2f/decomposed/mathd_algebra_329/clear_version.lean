macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "skip_hole" : term => `(sorry)

theorem mathd_algebra_329 (x y : ℝ) (h₀ : 3 * y = x) (h₁ : 2 * x + 5 * y = 11) : x + y = 4 := by
  have h₂ : y = 1 := by
    have h₂₁ : 11 * y = 11 := by
      hole_3
    hole_2
  
  have h₃ : x = 3 := by
    have h₃₁ : x = 3 * y := by hole_6
    hole_5
  
  have h₄ : x + y = 4 := by
    hole_7
  
  hole_1