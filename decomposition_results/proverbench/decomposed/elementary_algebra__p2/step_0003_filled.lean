theorem h₁₂ (a b c d : ℝ) (h h₁₁ : a ^ 2 + b ^ 2 + c ^ 2 + d ^ 2 = a * (b + c + d)) : (a - (b + c + d) / 2) ^ 2 + (3 * (b ^ 2 + c ^ 2 + d ^ 2) - 2 * (b * c + b * d + c * d)) / 4 = 0 := by
  --  nlinarith [sq_nonneg (a - (b + c + d) / 2), sq_nonneg (b - c), sq_nonneg (b - d), sq_nonneg (c - d)]
  linarith