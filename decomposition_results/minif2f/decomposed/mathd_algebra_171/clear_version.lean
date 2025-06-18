macro "hole_3" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "skip_hole" : term => `(sorry)

theorem mathd_algebra_171 (f : ℝ → ℝ) (h₀ : ∀ x, f x = 5 * x + 4) : f 1 = 9 := by
  have h₁ : f 1 = 5 * (1 : ℝ) + 4 := by
    have h₁₀ : f 1 = 5 * (1 : ℝ) + 4 := by
      hole_3
    hole_2
  
  have h₂ : f 1 = 9 := by
    hole_4
  
  hole_1