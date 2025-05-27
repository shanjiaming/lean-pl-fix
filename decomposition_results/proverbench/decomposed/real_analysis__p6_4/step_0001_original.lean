theorem series_diverges  : ¬Summable general_term :=
  by
  have h_main : ¬Summable general_term := by sorry
  exact h_main