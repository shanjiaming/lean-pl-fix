theorem h₄₅ (a : ℝ) (h₀ : √(4 + √(16 + 16 * a)) + √(1 + √(1 + a)) = 6) (h₁ : 16 + 16 * a ≥ 0) (h₂ : 1 + a ≥ 0) (h₃ : √(16 + 16 * a) = 4 * √(1 + a)) (h₄₂ : √(4 + 4 * √(1 + a)) = √(4 * (1 + √(1 + a)))) : √(4 * (1 + √(1 + a))) = √4 * √(1 + √(1 + a)) := by
  rw [← Real.sqrt_mul] <;>
    nlinarith [Real.sqrt_nonneg (1 + a), Real.sqrt_nonneg (1 + Real.sqrt (1 + a)),
      Real.sq_sqrt (show 0 ≤ 1 + a by linarith), Real.sq_sqrt (show 0 ≤ 1 + Real.sqrt (1 + a) by positivity)]