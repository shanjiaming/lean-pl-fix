/-- There are exactly four solutions in [0, 2π) -/
theorem exactly_four_solutions :
  ∃! (s : Finset ℝ), s.card = 4 ∧
    (∀ x ∈ s, x ∈ Set.Ico 0 (2 * Real.pi) ∧ equation x = 0) ∧
    (∀ x, x ∈ Set.Ico 0 (2 * Real.pi) ∧ equation x = 0 → x ∈ s) :=