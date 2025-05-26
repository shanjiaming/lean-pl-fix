theorem h_ub (n : ℕ) (hn hn' : n ≥ 2) (h_mem :  ∃ x,    x '' (↑(Finset.range n) : Set ℕ) = Set.Icc 1 (↑n : ℤ) ∧      ∑ i, x (↑i : ℕ) * x (((↑i : ℕ) + 1) % n) = (↑((fun n => (2 * n ^ 3 + 3 * n ^ 2 - 11 * n + 18) / 6) n) : ℤ)) : ∀ k ∈ {k | ∃ x, x '' (↑(Finset.range n) : Set ℕ) = Set.Icc 1 (↑n : ℤ) ∧ ∑ i, x (↑i : ℕ) * x (((↑i : ℕ) + 1) % n) = k},
    k ≤ (↑((fun n => (2 * n ^ 3 + 3 * n ^ 2 - 11 * n + 18) / 6) n) : ℤ) :=
  by
  --  intro k hk
  --  sorry
  hole