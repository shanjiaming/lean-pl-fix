theorem h₄ (n : ℕ) (hn : n > 0) (h₁ : ⌊(1 / 2) ^ n⌋ = 0) (h₃ : n > 0) : 0 - (↑n : ℤ) ≤ 0 := by
  have h₅ : (n : ℤ) > 0 := by sorry
  linarith