theorem h₂ (n : ℕ) (h₀ : 0 < n) (h₁ : ∏ k ∈ Finset.Icc 1 n, 1 = 1) : 1 / 2 ^ sorry ≤ 1 :=
  by
  have h₃ : (2 : ℝ) ^ k ≥ 1 := by sorry
  have h₄ : (1 : ℝ) / (2 : ℝ) ^ k ≤ 1 := by sorry
  exact h₄