theorem h_exists (h_main : A.mulVec solution = b) : ∃ x, A.mulVec x = b ∧ x = solution :=
  by
  --  refine' ⟨solution, _⟩
  --  exact ⟨h_main, rfl⟩
  simpa