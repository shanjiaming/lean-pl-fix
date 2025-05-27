theorem h₁ (x : ℝ) : ∃ x, IsLocalMax f x := by
  refine' ⟨2, _⟩
  exact local_max_at_2