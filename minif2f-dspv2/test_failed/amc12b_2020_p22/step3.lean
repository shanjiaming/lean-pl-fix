theorem h₁ (t u : ℝ) : u - 3 * u ^ 2 ≤ 1 / 12 := by
  nlinarith [sq_nonneg (u - 1 / 6), sq_nonneg (u + 1 / 6), sq_nonneg (u - 1 / 3), sq_nonneg (u + 1 / 3),
    sq_nonneg (u - 1 / 2), sq_nonneg (u + 1 / 2), sq_nonneg (u - 1), sq_nonneg (u + 1), sq_nonneg (u - 2),
    sq_nonneg (u + 2)]