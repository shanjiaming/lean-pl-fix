macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "skip_hole" : term => `(sorry)

theorem mathd_algebra_302 : (Complex.I / 2) ^ 2 = -(1 / 4) := by
  have h₀ : (Complex.I / 2 : ℂ) ^ 2 = -(1 / 4 : ℂ) := by
    hole_2
  
  hole_1