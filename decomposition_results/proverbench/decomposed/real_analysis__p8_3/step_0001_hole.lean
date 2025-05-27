theorem f_well_defined  : ∀ (x : ℝ), ∃! y, y = log (x ^ 2 + 1) :=
  by
  --  intro x
  have h_main : ∃! (y : ℝ), y = Real.log (x ^ 2 + 1) := by sorry
  --  exact h_main
  hole