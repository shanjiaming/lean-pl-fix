theorem h_backward (b : ℤ) (h_forward : b ∈ B → ∃ k, b = -44 + 5 * k) : (∃ k, b = -44 + 5 * k) → b ∈ B :=
  by
  intro h
  rcases h with ⟨k, rfl⟩
  have h₁ : ∃ (m n : Int), m = -110 + 12 * k ∧ n = 66 - 7 * k ∧ 7 * m + 12 * n = 22 := by sorry
  rcases h₁ with ⟨m, n, hm, hn, h_eq⟩
  have h₂ : (m, n) ∈ A := by sorry
  have h₃ : (-44 + 5 * k : Int) = m + n := by sorry
  refine' ⟨m, n, h₂, _⟩
  linarith