theorem putnam_1996_b3
  (n : ℕ) (hn : n ≥ 2) :
  IsGreatest
  {k | ∃ x : ℕ → ℤ,
    (x '' (Finset.range n) = Set.Icc (1 : ℤ) n) ∧
    ∑ i : Fin n, x i * x ((i + 1) % n) = k}
  (((fun n : ℕ => (2 * n ^ 3 + 3 * n ^ 2 - 11 * n + 18) / 6) : ℕ → ℕ ) n) := by
  
  have hn' : n ≥ 2 := by assumption

  -- Step 1: Prove that the value is achievable (membership in the set)
  have h_mem : (∃ (x : ℕ → ℤ), (x '' (Finset.range n) = Set.Icc (1 : ℤ) n) ∧ ∑ i : Fin n, x i * x ((i + 1) % n) = (((fun n : ℕ => (2 * n ^ 3 + 3 * n ^ 2 - 11 * n + 18) / 6) : ℕ → ℕ ) n)) := by
    use fun i => if (i : ℕ) < (n + 1) / 2 then (n : ℤ) - 2 * (i : ℤ) + 1 else 2 * ((i : ℤ) - (n : ℤ) / 2)
    constructor
    · -- Prove that the image of x over Finset.range n is Set.Icc (1 : ℤ) n
      sorry
    · -- Prove that the sum equals the given value
      sorry

  -- Step 2: Prove that the value is the greatest (upper bound property)
  have h_ub : ∀ (k : ℤ), (k ∈ {k | ∃ (x : ℕ → ℤ), (x '' (Finset.range n) = Set.Icc (1 : ℤ) n) ∧ ∑ i : Fin n, x i * x ((i + 1) % n) = k}) → k ≤ ((fun n : ℕ => (2 * n ^ 3 + 3 * n ^ 2 - 11 * n + 18) / 6 : ℕ → ℕ) n : ℤ) := by
    intro k hk
    sorry

  -- Combining the two to show `IsGreatest`
  have h_main : IsGreatest {k | ∃ (x : ℕ → ℤ), (x '' (Finset.range n) = Set.Icc (1 : ℤ) n) ∧ ∑ i : Fin n, x i * x ((i + 1) % n) = k} (((fun n : ℕ => (2 * n ^ 3 + 3 * n ^ 2 - 11 * n + 18) / 6) : ℕ → ℕ ) n) := by
    refine' ⟨_, _⟩
    · -- Prove that the value is in the set
      obtain ⟨x, hx₁, hx₂⟩ := h_mem
      refine' ⟨x, hx₁, _⟩
      simp_all
    · -- Prove that the value is the greatest in the set
      intro k hk
      have hk' : k ≤ ((fun n : ℕ => (2 * n ^ 3 + 3 * n ^ 2 - 11 * n + 18) / 6 : ℕ → ℕ) n : ℤ) := h_ub k hk
      exact_mod_cast hk'

  exact h_main