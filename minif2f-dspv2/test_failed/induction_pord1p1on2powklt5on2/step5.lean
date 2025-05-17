theorem h₄ (n : ℕ) (h₀ : 0 < n) (h₁ : ∏ k ∈ Finset.Icc 1 n, 1 = 1) : 1 ≤ 2 ^ sorry :=
  by
  have h₅ : (1 : ℝ) ≤ (2 : ℝ) ^ (k : ℕ) := by sorry
  simpa using h₅