theorem h₃₃ (n : ℕ) (h₀ : Even n) (h₁ : (↑n - 2) ^ 2 + ↑n ^ 2 + (↑n + 2) ^ 2 = 12296) (h₂ : ↑n ^ 2 = 4096) (h : ¬n ≤ 64) (h₃₂ : n ≥ 65) : ↑n ^ 2 > 4096 := by
  have h₃₄ : (n : ℤ) ≥ 65 := by sorry
  nlinarith