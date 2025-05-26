theorem h_main (n : ℕ) (npos : 0 < n) (M : Set (Matrix (Fin n) (Fin n) ℝ)) (h1 : 1 ∈ M) (h2 : ∀ A ∈ M, ∀ B ∈ M, Xor' (A * B ∈ M) (-A * B ∈ M)) (h3 : ∀ A ∈ M, ∀ B ∈ M, A * B = B * A ∨ A * B = -B * A) (h4 : ∀ A ∈ M, A ≠ 1 → ∃ B ∈ M, A * B = -B * A) : M = {1} := by
  apply Set.Subset.antisymm
  · intro A hA
    by_contra h
    have h5 : ∃ B ∈ M, A * B = -B * A := h4 A hA h
    obtain ⟨B, hB, h6⟩ := h5
    have h7 : A * B = 0 := by sorry
    have h8 : -A * B = 0 := by sorry
    have h9 : A * B ∈ M ∨ -A * B ∈ M → False := by sorry
    by_cases h10 : A * B ∈ M
    · exfalso
      exact h9 (Or.inl h10)
    · by_cases h11 : -A * B ∈ M
      · exfalso
        exact h9 (Or.inr h11)
      ·
        have h12 : Xor' (A * B ∈ M) (-A * B ∈ M) := h2 A hA B hB
        simp [h10, h11, Xor'] at h12 <;> aesop
  · intro A hA
    simp only [Set.mem_singleton_iff] at hA ⊢
    rw [hA]
    exact h1