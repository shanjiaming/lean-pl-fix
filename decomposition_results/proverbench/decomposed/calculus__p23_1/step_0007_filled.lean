theorem h₂ (n : ℕ) (h₁ : 3 ^ n + 2 ^ n = 3 ^ n * (1 + (2 / 3) ^ n)) : 3 ^ (n + 1) - 2 ^ (n + 1) = 3 ^ (n + 1) * (1 - (2 / 3) ^ (n + 1)) :=
  by
  have h₂₁ : (3 : ℝ) ^ (n + 1) > 0 := by sorry
  have h₂₂ : (2 : ℝ) / 3 > 0 := by sorry
  have h₂₃ : (1 : ℝ) - (2 / 3 : ℝ) ^ (n + 1) > 0 := by sorry
  have h₂₄ : (3 : ℝ) ^ (n + 1) * (1 - (2 / 3 : ℝ) ^ (n + 1)) = (3 : ℝ) ^ (n + 1) - (2 : ℝ) ^ (n + 1) := by sorry
  --  linarith
  hole