theorem h_ub (n : ℕ) (hn hn' : n ≥ 2) (h_mem :  ∃ x,    x '' ↑(Finset.range n) = Set.Icc 1 ↑n ∧      ∑ i, x ↑i * x ((↑i + 1) % n) = ↑((fun n => (2 * n ^ 3 + 3 * n ^ 2 - 11 * n + 18) / 6) n)) : ∀ k ∈ {k | ∃ x, x '' ↑(Finset.range n) = Set.Icc 1 ↑n ∧ ∑ i, x ↑i * x ((↑i + 1) % n) = k},
    k ≤ ↑((fun n => (2 * n ^ 3 + 3 * n ^ 2 - 11 * n + 18) / 6) n) :=
  by
  intro k hk
  sorry