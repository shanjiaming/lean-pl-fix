theorem putnam_2004_a1 (S : (ℕ → Fin 2) → ℕ → ℝ)
  (hS : ∀ attempts, ∀ N ≥ 1, S attempts N = (∑ i : Fin N, (attempts i).1) / N) :
  (∀ attempts a b,
      (1 ≤ a ∧ a < b ∧ S attempts a < 0.8 ∧ S attempts b > 0.8) → (∃ c : ℕ, a < c ∧ c < b ∧ S attempts c = 0.8)) ↔
    ((True) : Prop):=
  by
  have h_main :
    (∀ (attempts : ℕ → Fin 2) (a b : ℕ),
      (1 ≤ a ∧ a < b ∧ S attempts a < 0.8 ∧ S attempts b > 0.8) → (∃ c : ℕ, a < c ∧ c < b ∧ S attempts c = 0.8)) := by sorry
  have h_final :
    ((∀ (attempts : ℕ → Fin 2) (a b : ℕ),
        (1 ≤ a ∧ a < b ∧ S attempts a < 0.8 ∧ S attempts b > 0.8) → (∃ c : ℕ, a < c ∧ c < b ∧ S attempts c = 0.8)) ↔
      True) := by sorry
  --  exact h_final
  hole