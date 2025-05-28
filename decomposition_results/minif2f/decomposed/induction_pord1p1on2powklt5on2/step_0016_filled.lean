theorem h₃ (n : ℕ) (h₀ : 0 < n) (h₁ : ∏ k ∈ Finset.Icc 1 n, 1 = 1) (h₂ : 1 / 2 ^ sorry ≤ 1) : ∏ k ∈ Finset.Icc 1 n, 1 + 1 / 2 ^ sorry < 5 / 2 :=
  by
  have h₃ : (∏ k in Finset.Icc 1 n, (1 : ℝ)) = 1 := by sorry
  --  rw [h₃]
  have h₄ : (1 : ℝ) + (1 : ℝ) / (2 : ℝ) ^ k ≤ 2 := by sorry
  have h₅ : (1 : ℝ) + (1 : ℝ) / (2 : ℝ) ^ k < 5 / 2 := by sorry
  linarith
  hole