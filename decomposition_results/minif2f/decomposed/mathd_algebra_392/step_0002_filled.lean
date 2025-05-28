theorem h₂ (n : ℕ) (h₀ : Even n) (h₁ : (↑n - 2) ^ 2 + ↑n ^ 2 + (↑n + 2) ^ 2 = 12296) : ↑n ^ 2 = 4096 :=
  by
  have h₂₁ : 3 * (n : ℤ) ^ 2 + 8 = 12296 := by sorry
  have h₂₂ : (n : ℤ) ^ 2 = 4096 := by sorry
  --  exact h₂₂
  linarith