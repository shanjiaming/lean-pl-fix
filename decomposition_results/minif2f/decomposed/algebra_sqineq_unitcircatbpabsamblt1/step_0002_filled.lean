theorem h₁ (a b : ℝ) (h₀ : a ^ 2 + b ^ 2 = 1) : a ≤ 1 := by -- nlinarith [sq_nonneg (a - 1), sq_nonneg b] <;> nlinarith
  nlinarith