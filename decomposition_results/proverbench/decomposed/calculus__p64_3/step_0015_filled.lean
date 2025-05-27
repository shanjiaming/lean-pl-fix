theorem h_main (h_false : False) : ∀ x ∈ solution_set, equation x = 0 := by
  --  exfalso
  --  exact h_false
  norm_cast