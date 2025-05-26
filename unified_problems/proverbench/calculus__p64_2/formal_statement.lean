/-- Verify each solution lies in [0, 2π) -/
lemma solutions_in_interval :
  ∀ x ∈ solution_set, x ∈ Set.Ico 0 (2 * Real.pi) :=