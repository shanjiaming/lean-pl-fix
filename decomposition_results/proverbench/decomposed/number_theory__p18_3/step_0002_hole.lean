theorem h_forward (b : ℤ) : b ∈ B → ∃ k, b = -44 + 5 * k := by
  --  intro h
  --  rcases h with ⟨m, n, hm, rfl⟩
  have h₁ : 7 * m + 12 * n = 22 := by sorry
  have h₂ : ∃ k : Int, m + n = -44 + 5 * k := by sorry
  --  rcases h₂ with ⟨k, hk⟩
  --  refine' ⟨k, _⟩
  --  linarith
  hole