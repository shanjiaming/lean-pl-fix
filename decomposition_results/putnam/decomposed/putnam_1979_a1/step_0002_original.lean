theorem h_main_goal (P : Multiset ℕ → Prop) (hP : ∀ (a : Multiset ℕ), P a ↔ a.card > 0 ∧ (∀ i ∈ a, i > 0) ∧ a.sum = 1979) : P (Multiset.replicate 659 3 + {2}) ∧ ∀ (a : Multiset ℕ), P a → (Multiset.replicate 659 3 + {2}).prod ≥ a.prod :=
  by
  constructor
  · rw [hP]
    constructor
    · norm_num [Multiset.card_replicate, Multiset.card_singleton] <;> decide
    constructor
    · intro i hi
      have h₁ : i = 3 ∨ i = 2 := by sorry
      cases h₁ with
      | inl h₁ => norm_num [h₁]
      | inr h₁ => norm_num [h₁]
    · norm_num [Multiset.sum_replicate, Multiset.sum_singleton] <;> rfl
  · intro a h_a
    have h₁ : (Multiset.replicate 659 3 + { 2 } : Multiset ℕ).prod ≥ a.prod := by sorry
    exact h₁