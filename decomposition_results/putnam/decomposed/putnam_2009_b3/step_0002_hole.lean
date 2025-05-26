theorem h_main (mediocre : ℤ → Set ℤ → Prop) (hmediocre : ∀ (n : ℤ) (S : Set ℤ), mediocre n S ↔ S ⊆ sorry ∧ ∀ a ∈ S, ∀ b ∈ S, 2 ∣ a + b → (a + b) / 2 ∈ S) (A : ℤ → ℤ) (hA : A = fun n => (↑{S | mediocre n S}.ncard : ℤ)) : {n | n > 0 ∧ A (n + 2) - 2 * A (n + 1) + A n = 1} = {n | ∃ k ≥ 1, n = 2 ^ k - 1} :=
  by
  --  apply Set.ext
  --  intro n
  --  simp only [Set.mem_setOf_eq, Set.mem_setOf_eq]
  --  constructor
  --  · intro h
    have h₁ : n > 0 := h.1
    have h₂ : A (n + 2) - 2 * A (n + 1) + A n = 1 := h.2
    have h₃ : ∃ k ≥ 1, n = 2 ^ k - 1 := by sorry
  --    exact h₃
  --  · intro h
    have h₁ : ∃ k ≥ 1, n = 2 ^ k - 1 := h
    have h₂ : n > 0 := by sorry
    have h₃ : A (n + 2) - 2 * A (n + 1) + A n = 1 := by sorry
  --    exact ⟨h₂, h₃⟩
  hole