theorem putnam_1975_b3 :
  ∀ k : ℕ,
    k > 0 →
      (∀ a : Multiset ℝ,
          (∀ i ∈ a, i > 0) ∧ card a ≥ k →
            (esymm a k) / (esymm a 1) ^ k ≤ ((fun k : ℕ => 1 / (Nat.factorial k)) : ℕ → ℝ) k) ∧
        ∀ M : ℝ,
          M < ((fun k : ℕ => 1 / (Nat.factorial k)) : ℕ → ℝ) k →
            (∃ a : Multiset ℝ, (∀ i ∈ a, i > 0) ∧ card a ≥ k ∧ (esymm a k) / (esymm a 1) ^ k > M):=
  by
  intro k hk
  have h_main :
    (∀ a : Multiset ℝ,
        (∀ i ∈ a, i > 0) ∧ card a ≥ k →
          (esymm a k) / (esymm a 1) ^ k ≤ ((fun k : ℕ => 1 / (Nat.factorial k)) : ℕ → ℝ) k) ∧
      ∀ M : ℝ,
        M < ((fun k : ℕ => 1 / (Nat.factorial k)) : ℕ → ℝ) k →
          (∃ a : Multiset ℝ, (∀ i ∈ a, i > 0) ∧ card a ≥ k ∧ (esymm a k) / (esymm a 1) ^ k > M) := by sorry
  exact h_main
  hole