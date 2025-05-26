/-- Any solution in [0, 2π) must be one of our four solutions -/
lemma all_solutions_found (x : ℝ) (h : x ∈ Set.Ico 0 (2 * Real.pi)) :
  equation x = 0 → x ∈ solution_set :=