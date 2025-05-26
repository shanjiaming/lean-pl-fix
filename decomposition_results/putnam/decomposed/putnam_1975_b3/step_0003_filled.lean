theorem h₁ (k : ℕ) (hk : k > 0) : ∀ (a : Multiset ℝ), (∀ i ∈ a, i > 0) ∧ sorry ≥ k → sorry / sorry ^ k ≤ (fun k => 1 / (↑k ! : ℝ)) k :=
  by
  --  intro a h
  have h₂ : ∀ i ∈ a, i > 0 := h.1
  have h₃ : card a ≥ k := h.2
  have h₄ : (esymm a k : ℝ) ≤ (esymm a 1 : ℝ) ^ k / (Nat.factorial k : ℝ) := by sorry
  have h₅ : (esymm a k : ℝ) / (esymm a 1 : ℝ) ^ k ≤ 1 / (Nat.factorial k : ℝ) := by sorry
  have h₆ : ((fun k : ℕ => 1 / (Nat.factorial k)) : ℕ → ℝ) k = 1 / (Nat.factorial k : ℝ) := by sorry
  --  rw [h₆] at *
  --  exact h₅
  hole