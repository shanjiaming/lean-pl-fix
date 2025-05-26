theorem h₁ (u : ℝ) : sorry = (u ^ 2 + 0 ^ 2) * rexp (-(u + 0)) := by
  calc
    f u 0 = (u ^ 2 + (0 : ℝ) ^ 2) * Real.exp (-(u + 0)) := rfl
    _ = (u ^ 2 + 0 ^ 2 : ℝ) * Real.exp (-(u + 0)) := by norm_num
    _ = (u ^ 2 + 0 ^ 2 : ℝ) * Real.exp (-(u + 0)) := rfl