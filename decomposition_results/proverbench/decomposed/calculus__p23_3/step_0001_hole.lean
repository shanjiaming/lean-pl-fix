theorem sequence_limit (n : ℕ) : Tendsto a_n Filter.atTop (nhds (1 / 3)) :=
  by
  have h_main : Filter.Tendsto a_n Filter.atTop (nhds (1 / 3)) := by sorry
  --  exact h_main
  hole