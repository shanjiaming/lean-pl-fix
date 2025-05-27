theorem h₅ (k : ℕ) (hk : k ∈ Finset.Icc 2 10000) (h₂ : 2 ≤ k ∧ k ≤ 10000) (h₃ : (↑k : ℝ) ≥ 2) (h₄ : (↑k : ℝ) ≤ 10000) : (↑k : ℝ) - 1 ≥ 1 := by
  have h₅₁ : (k : ℝ) ≥ 2 := h₃
  linarith