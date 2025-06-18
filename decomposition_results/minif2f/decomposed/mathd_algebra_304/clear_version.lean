macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "skip_hole" : term => `(sorry)

theorem mathd_algebra_304 : 91 ^ 2 = 8281 := by
  have h₀ : 91 ^ 2 = 8281 := by
    hole_2
  
  hole_1