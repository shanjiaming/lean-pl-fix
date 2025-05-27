theorem h₂ (x : ℝ) (h₁ : ∃ x, IsLocalMax f x) : ∃ x, IsLocalMin f x := by
  refine' ⟨4, _⟩
  exact local_min_at_4