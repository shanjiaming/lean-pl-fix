theorem f_well_defined :
  ∀ x : ℝ, ∃! y : ℝ, y = Real.log (x^2 + 1) := by
  intro x
  have h_main : ∃! (y : ℝ), y = Real.log (x^2 + 1) := by
    admit
  admit