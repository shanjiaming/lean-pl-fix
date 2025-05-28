theorem h₃₂ (h₁ :  ∫ (x : ℝ) in 0 ..1, x ^ 4 * (1 - x) ^ 4 / (1 + x ^ 2) =    ∫ (x : ℝ) in 0 ..1, x ^ 6 - 4 * x ^ 5 + 5 * x ^ 4 - 4 * x ^ 2 + 4 - 4 / (1 + x ^ 2)) : ∫ (x : ℝ) in 0 ..1, x ^ 6 - 4 * x ^ 5 + 5 * x ^ 4 - 4 * x ^ 2 + 4 - 4 / (1 + x ^ 2) =
    (∫ (x : ℝ) in 0 ..1, x ^ 6 - 4 * x ^ 5 + 5 * x ^ 4 - 4 * x ^ 2 + 4) - ∫ (x : ℝ) in 0 ..1, 4 / (1 + x ^ 2) :=
  by
  rw [intervalIntegral.integral_sub] <;> (try norm_num) <;>
      (try {
          apply Continuous.intervalIntegrable
          continuity
        }) <;>
    (try {
        apply Continuous.intervalIntegrable
        continuity
      })