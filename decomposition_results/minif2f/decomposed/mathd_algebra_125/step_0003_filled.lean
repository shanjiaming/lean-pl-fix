theorem h₃₁ (x y : ℕ) (h₀ : 0 < x ∧ 0 < y) (h₁ : 5 * x = y) (h₂ : ↑x - 3 + (↑y - 3) = 30) : ↑x - 3 + (↑y - 3) = 30 := by -- simpa using h₂
  linarith