theorem series_diverges : ¬ Summable general_term := by
  have h_main : ¬ Summable general_term := by
    apply comparison_test upper_bound
    exact comparison_series_diverges
  
  exact h_main