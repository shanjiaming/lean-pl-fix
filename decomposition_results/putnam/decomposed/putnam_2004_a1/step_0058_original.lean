theorem h_final (S : (ℕ → Fin 2) → ℕ → ℝ) (hS : ∀ (attempts : ℕ → Fin 2), ∀ N ≥ 1, S attempts N = (↑(∑ i, (↑(attempts (↑i : ℕ)) : ℕ)) : ℝ) / (↑N : ℝ)) (h_main :  ∀ (attempts : ℕ → Fin 2) (a b : ℕ),    1 ≤ a ∧ a < b ∧ S attempts a < 0.8 ∧ S attempts b > 0.8 → ∃ c, a < c ∧ c < b ∧ S attempts c = 0.8) : (∀ (attempts : ℕ → Fin 2) (a b : ℕ),
      1 ≤ a ∧ a < b ∧ S attempts a < 0.8 ∧ S attempts b > 0.8 → ∃ c, a < c ∧ c < b ∧ S attempts c = 0.8) ↔
    True :=
  by
  constructor
  · intro h
    trivial
  · intro h
    exact h_main