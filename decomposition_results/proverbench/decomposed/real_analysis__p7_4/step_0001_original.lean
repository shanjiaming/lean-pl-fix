theorem critical_point (x : ℝ) : ∃! c, c ∈ Set.Ioo 0 8 ∧ HasDerivAt f 0 c :=
  by
  have h_main : ∃! c, c ∈ Set.Ioo 0 8 ∧ HasDerivAt f 0 c := by sorry
  exact h_main