theorem h₃₁ (n : ℕ) (h₀ : Even n) (h₁ : (↑n - 2) ^ 2 + ↑n ^ 2 + (↑n + 2) ^ 2 = 12296) (h₂ : ↑n ^ 2 = 4096) : n ≤ 64 := by
  --  by_contra h
  have h₃₂ : n ≥ 65 := by sorry
  have h₃₃ : (n : ℤ) ^ 2 > 4096 := by sorry
  --  linarith
  hole