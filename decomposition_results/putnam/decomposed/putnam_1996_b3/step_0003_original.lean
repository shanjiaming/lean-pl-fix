theorem h_mem (n : ℕ) (hn hn' : n ≥ 2) : ∃ x,
    x '' ↑(Finset.range n) = Set.Icc 1 ↑n ∧
      ∑ i, x ↑i * x ((↑i + 1) % n) = ↑((fun n => (2 * n ^ 3 + 3 * n ^ 2 - 11 * n + 18) / 6) n) :=
  by
  use fun i => if (i : ℕ) < (n + 1) / 2 then (n : ℤ) - 2 * (i : ℤ) + 1 else 2 * ((i : ℤ) - (n : ℤ) / 2)
  constructor
  · sorry
  · sorry