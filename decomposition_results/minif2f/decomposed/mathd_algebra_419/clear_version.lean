macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "skip_hole" : term => `(sorry)

theorem mathd_algebra_419 (a b : ℝ) (h₀ : a = -1) (h₁ : b = 5) : -a - b ^ 2 + 3 * (a * b) = -39 := by
  have h₂ : -a = 1 := by
    hole_2
  
  have h₃ : b ^ 2 = 25 := by
    hole_3
  
  have h₄ : 3 * (a * b) = -15 := by
    hole_4
  
  have h₅ : -a - b ^ 2 + 3 * (a * b) = -39 := by
    hole_5
  
  hole_1