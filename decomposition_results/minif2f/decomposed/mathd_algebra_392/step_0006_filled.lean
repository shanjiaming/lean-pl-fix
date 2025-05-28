theorem h₂₃ (n : ℕ) (h₀ : Even n) (h₁ : (↑n - 2) ^ 2 + ↑n ^ 2 + (↑n + 2) ^ 2 = 12296) (h₂₁ : 3 * ↑n ^ 2 + 8 = 12296) : 3 * ↑n ^ 2 = 12288 := by -- linarith
  linarith