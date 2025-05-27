theorem putnam_2003_a1
(n : ℕ) (hn : n > 0)
: Set.encard {a : ℕ → ℤ |
  ∃ k > 0, (∑ i : Fin k, a i = n) ∧
    (∀ i : Fin k, a i > 0) ∧
    (∀ i : Fin (k - 1), a i ≤ a (i + 1)) ∧
    a (k - 1) ≤ a 0 + 1 ∧ (∀ i ≥ k, a i = 0)}
  = ((fun n => n) : ℕ → ℕ ) n := by