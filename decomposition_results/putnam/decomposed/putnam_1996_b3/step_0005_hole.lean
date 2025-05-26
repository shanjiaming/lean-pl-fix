theorem h_main (n : ℕ) (hn hn' : n ≥ 2) (h_mem :  ∃ x,    x '' (↑(Finset.range n) : Set ℕ) = Set.Icc 1 (↑n : ℤ) ∧      ∑ i, x (↑i : ℕ) * x (((↑i : ℕ) + 1) % n) = (↑((fun n => (2 * n ^ 3 + 3 * n ^ 2 - 11 * n + 18) / 6) n) : ℤ)) (h_ub :  ∀ k ∈ {k | ∃ x, x '' (↑(Finset.range n) : Set ℕ) = Set.Icc 1 (↑n : ℤ) ∧ ∑ i, x (↑i : ℕ) * x (((↑i : ℕ) + 1) % n) = k},    k ≤ (↑((fun n => (2 * n ^ 3 + 3 * n ^ 2 - 11 * n + 18) / 6) n) : ℤ)) : IsGreatest
    {k | ∃ x, x '' (↑(Finset.range n) : Set ℕ) = Set.Icc 1 (↑n : ℤ) ∧ ∑ i, x (↑i : ℕ) * x (((↑i : ℕ) + 1) % n) = k}
    (↑((fun n => (2 * n ^ 3 + 3 * n ^ 2 - 11 * n + 18) / 6) n) : ℤ) :=
  by
  --  refine' ⟨_, _⟩
  --  · obtain ⟨x, hx₁, hx₂⟩ := h_mem
  --    refine' ⟨x, hx₁, _⟩
  --    simp_all
  --  · intro k hk
    have hk' : k ≤ ((fun n : ℕ => (2 * n ^ 3 + 3 * n ^ 2 - 11 * n + 18) / 6 : ℕ → ℕ) n : ℤ) := h_ub k hk
    exact_mod_cast hk'
  hole