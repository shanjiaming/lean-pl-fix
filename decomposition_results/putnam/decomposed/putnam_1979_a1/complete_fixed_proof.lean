theorem putnam_1979_a1 (P : Multiset ℕ → Prop) (hP : ∀ a, P a ↔ Multiset.card a > 0 ∧ (∀ i ∈ a, i > 0) ∧ a.sum = 1979) :
  P ((Multiset.replicate 659 3 + { 2 }) : Multiset ℕ) ∧
    ∀ a : Multiset ℕ, P a → ((Multiset.replicate 659 3 + { 2 }) : Multiset ℕ).prod ≥ a.prod:=
  by
  have h_main_goal :
    P ((Multiset.replicate 659 3 + { 2 }) : Multiset ℕ) ∧
      ∀ a : Multiset ℕ, P a → ((Multiset.replicate 659 3 + { 2 }) : Multiset ℕ).prod ≥ a.prod := by sorry
  --  exact h_main_goal
  norm_cast