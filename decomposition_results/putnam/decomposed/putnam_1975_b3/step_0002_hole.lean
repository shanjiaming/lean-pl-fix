theorem h_main (k : ℕ) (hk : k > 0) : (∀ (a : Multiset ℝ), (∀ i ∈ a, i > 0) ∧ sorry ≥ k → sorry / sorry ^ k ≤ (fun k => 1 / (↑k ! : ℝ)) k) ∧
    ∀ M < (fun k => 1 / (↑k ! : ℝ)) k, ∃ a, (∀ i ∈ a, i > 0) ∧ sorry ≥ k ∧ sorry / sorry ^ k > M :=
  by
  have h₁ :
    ∀ a : Multiset ℝ,
      (∀ i ∈ a, i > 0) ∧ card a ≥ k → (esymm a k) / (esymm a 1) ^ k ≤ ((fun k : ℕ => 1 / (Nat.factorial k)) : ℕ → ℝ) k := by sorry
  have h₂ :
    ∀ M : ℝ,
      M < ((fun k : ℕ => 1 / (Nat.factorial k)) : ℕ → ℝ) k →
        (∃ a : Multiset ℝ, (∀ i ∈ a, i > 0) ∧ card a ≥ k ∧ (esymm a k) / (esymm a 1) ^ k > M) := by sorry
  exact ⟨h₁, h₂⟩
  hole