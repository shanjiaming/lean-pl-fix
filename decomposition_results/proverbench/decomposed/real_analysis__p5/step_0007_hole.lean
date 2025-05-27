theorem h₃ (a b c d : ℝ) (h : a ^ 2 + b ^ 2 + c ^ 2 + d ^ 2 = a * (b + c + d)) (h₁ : a = 0) : a ^ 2 / 4 + (b - a / 2) ^ 2 + (c - a / 2) ^ 2 + (d - a / 2) ^ 2 = 0 := by
  --  nlinarith [sq_nonneg (b - a / 2), sq_nonneg (c - a / 2), sq_nonneg (d - a / 2), sq_nonneg (b + c + d - 3 * a / 2)]
  hole