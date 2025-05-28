theorem h₂₄ (n : ℕ) (h₀ : Even n) (h₁ : (↑n - 2) ^ 2 + ↑n ^ 2 + (↑n + 2) ^ 2 = 12296) (h₂₁ : 3 * ↑n ^ 2 + 8 = 12296) (h₂₃ : 3 * ↑n ^ 2 = 12288) : ↑n ^ 2 = 4096 := by -- linarith
  linarith