theorem h₃ (a : ℝ) (h₀ : a * (2 - a) = 2 * a - a ^ 2) (h₁ : (a - 1) ^ 2 ≥ 0) : 2 * a - a ^ 2 ≤ 1 := by -- nlinarith [sq_nonneg (a - 1)]
  linarith