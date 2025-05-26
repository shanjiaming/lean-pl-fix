theorem h₂₃ (n : ℕ) (h₁ : 3 ^ n + 2 ^ n = 3 ^ n * (1 + (2 / 3) ^ n)) (h₂₁ : 3 ^ (n + 1) > 0) (h₂₂ : 2 / 3 > 0) : 1 - (2 / 3) ^ (n + 1) > 0 :=
  by
  have h₂₄ : (2 / 3 : ℝ) ^ (n + 1) < 1 := by sorry
  --  linarith
  hole