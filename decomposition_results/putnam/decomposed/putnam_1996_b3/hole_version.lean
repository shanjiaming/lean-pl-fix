macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem putnam_1996_b3
  (n : ℕ) (hn : n ≥ 2) :
  IsGreatest
  {k | ∃ x : ℕ → ℤ,
    (x '' (Finset.range n) = Set.Icc (1 : ℤ) n) ∧
    ∑ i : Fin n, x i * x ((i + 1) % n) = k}
  (((fun n : ℕ => (2 * n ^ 3 + 3 * n ^ 2 - 11 * n + 18) / 6) : ℕ → ℕ ) n) := by
  
  have hn' : n ≥ 2 := by hole_2

  
  have h_mem : (∃ (x : ℕ → ℤ), (x '' (Finset.range n) = Set.Icc (1 : ℤ) n) ∧ ∑ i : Fin n, x i * x ((i + 1) % n) = (((fun n : ℕ => (2 * n ^ 3 + 3 * n ^ 2 - 11 * n + 18) / 6) : ℕ → ℕ ) n)) := by
    hole_3

  
  have h_ub : ∀ (k : ℤ), (k ∈ {k | ∃ (x : ℕ → ℤ), (x '' (Finset.range n) = Set.Icc (1 : ℤ) n) ∧ ∑ i : Fin n, x i * x ((i + 1) % n) = k}) → k ≤ ((fun n : ℕ => (2 * n ^ 3 + 3 * n ^ 2 - 11 * n + 18) / 6 : ℕ → ℕ) n : ℤ) := by
    hole_4

  
  have h_main : IsGreatest {k | ∃ (x : ℕ → ℤ), (x '' (Finset.range n) = Set.Icc (1 : ℤ) n) ∧ ∑ i : Fin n, x i * x ((i + 1) % n) = k} (((fun n : ℕ => (2 * n ^ 3 + 3 * n ^ 2 - 11 * n + 18) / 6) : ℕ → ℕ ) n) := by
    refine' ⟨_, _⟩
    · 
      obtain ⟨x, hx₁, hx₂⟩ := h_mem
      refine' ⟨x, hx₁, _⟩
      simp_all
    · 
      intro k hk
      have hk' : k ≤ ((fun n : ℕ => (2 * n ^ 3 + 3 * n ^ 2 - 11 * n + 18) / 6 : ℕ → ℕ) n : ℤ) := h_ub k hk
      hole_5

  hole_1