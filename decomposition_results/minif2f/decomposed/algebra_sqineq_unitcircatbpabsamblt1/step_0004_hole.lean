theorem h₃ (a b : ℝ) (h₀ : a ^ 2 + b ^ 2 = 1) (h₁ : a ≤ 1) (h₂ : a ≥ -1) : b ≤ 1 := by -- nlinarith [sq_nonneg (b - 1), sq_nonneg a]
  hole