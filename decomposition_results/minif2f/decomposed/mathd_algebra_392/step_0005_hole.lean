theorem h₂₂ (n : ℕ) (h₀ : Even n) (h₁ : (↑n - 2) ^ 2 + ↑n ^ 2 + (↑n + 2) ^ 2 = 12296) (h₂₁ : 3 * ↑n ^ 2 + 8 = 12296) : ↑n ^ 2 = 4096 := by
  have h₂₃ : 3 * (n : ℤ) ^ 2 = 12288 := by sorry
  have h₂₄ : (n : ℤ) ^ 2 = 4096 := by sorry
  --  exact h₂₄
  hole