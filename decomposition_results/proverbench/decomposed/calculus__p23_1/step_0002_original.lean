theorem h₁ (n✝ n : ℕ) : 3 ^ n + 2 ^ n = 3 ^ n * (1 + (2 / 3) ^ n) :=
  by
  have h₁₁ : (3 : ℝ) ^ n > 0 := by sorry
  have h₁₂ : (2 : ℝ) / 3 > 0 := by sorry
  have h₁₃ : (1 : ℝ) + (2 / 3 : ℝ) ^ n > 0 := by sorry
  have h₁₄ : (3 : ℝ) ^ n * (1 + (2 / 3 : ℝ) ^ n) = (3 : ℝ) ^ n + (2 : ℝ) ^ n := by sorry
  linarith