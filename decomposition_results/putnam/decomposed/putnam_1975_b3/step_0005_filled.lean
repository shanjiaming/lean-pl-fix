theorem h₅ (k : ℕ) (hk : k > 0) (a : Multiset ℝ) (h : (∀ i ∈ a, i > 0) ∧ sorry ≥ k) (h₂ : ∀ i ∈ a, i > 0) (h₃ : sorry ≥ k) : ∀ (s : Multiset ℝ), (∀ i ∈ s, i > 0) → sorry ≥ k → sorry ≤ sorry ^ k / (↑k ! : ℝ) :=
  by
  --  intro s h₅ h₆
  have h₇ : (esymm s k : ℝ) ≤ (esymm s 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := by sorry
  --  exact h₇
  hole