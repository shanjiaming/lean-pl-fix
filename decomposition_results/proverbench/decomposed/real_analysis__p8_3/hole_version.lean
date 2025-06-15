macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem f_well_defined :
  ∀ x : ℝ, ∃! y : ℝ, y = Real.log (x^2 + 1) := by
  intro x
  have h_main : ∃! (y : ℝ), y = Real.log (x^2 + 1) := by
    hole_2
  hole_1