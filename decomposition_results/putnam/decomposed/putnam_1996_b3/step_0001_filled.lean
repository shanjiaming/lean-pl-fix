theorem putnam_1996_b3 (n : ℕ) (hn : n ≥ 2) : IsGreatest
    {k | ∃ x, x '' (↑(Finset.range n) : Set ℕ) = Set.Icc 1 (↑n : ℤ) ∧ ∑ i, x (↑i : ℕ) * x (((↑i : ℕ) + 1) % n) = k}
    (↑((fun n => (2 * n ^ 3 + 3 * n ^ 2 - 11 * n + 18) / 6) n) : ℤ) :=
  by
  have hn' : n ≥ 2 := by sorry
  have h_mem :
    (∃ (x : ℕ → ℤ),
      (x '' (Finset.range n) = Set.Icc (1 : ℤ) n) ∧
        ∑ i : Fin n, x i * x ((i + 1) % n) = (((fun n : ℕ => (2 * n ^ 3 + 3 * n ^ 2 - 11 * n + 18) / 6) : ℕ → ℕ) n)) := by sorry
  have h_ub :
    ∀ (k : ℤ),
      (k ∈ {k | ∃ (x : ℕ → ℤ), (x '' (Finset.range n) = Set.Icc (1 : ℤ) n) ∧ ∑ i : Fin n, x i * x ((i + 1) % n) = k}) →
        k ≤ ((fun n : ℕ => (2 * n ^ 3 + 3 * n ^ 2 - 11 * n + 18) / 6 : ℕ → ℕ) n : ℤ) := by sorry
  have h_main :
    IsGreatest {k | ∃ (x : ℕ → ℤ), (x '' (Finset.range n) = Set.Icc (1 : ℤ) n) ∧ ∑ i : Fin n, x i * x ((i + 1) % n) = k}
      (((fun n : ℕ => (2 * n ^ 3 + 3 * n ^ 2 - 11 * n + 18) / 6) : ℕ → ℕ) n) := by sorry
  --  exact h_main
  hole