theorem h₆₂ (a b : ℝ) (h₀ : a ^ 2 + b ^ 2 = 1) (h₁ : a ≤ 1) (h₂ : a ≥ -1) (h₃ : b ≤ 1) (h₄ : b ≥ -1) (h₅ : a ≥ b → a * b + |a - b| ≤ 1) (h₆ : a < b) (h₆₁ : |a - b| = b - a) : a * b + (b - a) ≤ 1 :=
  by
  have h₆₃ : (a + 1) * (b - 1) ≤ 0 := by sorry
  --  nlinarith [sq_nonneg (a + 1), sq_nonneg (b - 1)]
  linarith