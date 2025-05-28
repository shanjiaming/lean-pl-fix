theorem h₁ (P : Multiset ℕ → Prop) (hP : ∀ (a : Multiset ℕ), P a ↔ a.card > 0 ∧ (∀ i ∈ a, i > 0) ∧ a.sum = 1979) (i : ℕ) (hi : i ∈ Multiset.replicate 659 3 + {2}) : i = 3 ∨ i = 2 :=
  by
  have h₂ : i ∈ (Multiset.replicate 659 3 + ({ 2 } : Multiset ℕ)) := hi
  have h₃ : i ∈ Multiset.replicate 659 3 ∨ i ∈ ({ 2 } : Multiset ℕ) := by sorry
  --  cases h₃ with
  --  | inl h₃ =>
  --    have h₄ : i ∈ Multiset.replicate 659 3 := h₃
  --    have h₅ : i = 3 := by
  --      rw [Multiset.mem_replicate] at h₄
  --      exact h₄.2
  --    exact Or.inl h₅
  --  | inr h₃ =>
  --    have h₄ : i ∈ ({ 2 } : Multiset ℕ) := h₃
  --    have h₅ : i = 2 := by simpa [Multiset.mem_singleton] using h₄
  --    exact Or.inr h₅
  hole