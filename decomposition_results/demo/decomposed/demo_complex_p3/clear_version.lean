macro "hole_1" : tactic => `(tactic| admit)
macro "skip_hole" : term => `(sorry)

theorem contradiction_with_have (a b : ℕ) (h : a + b = 0) : a = 0 ∧ b = 0 := by
  hole_1