theorem h₃₂ (a : ℝ) (h₀ : √(4 + √(16 + 16 * a)) + √(1 + √(1 + a)) = 6) (h₁ : 16 + 16 * a ≥ 0) (h₂ : 1 + a ≥ 0) (h₃₁ : √(16 + 16 * a) = √(16 * (1 + a))) : √(16 * (1 + a)) = 4 * √(1 + a) :=
  by
  rw [Real.sqrt_eq_iff_sq_eq (by positivity) (by positivity)]
  nlinarith [Real.sq_sqrt (show 0 ≤ 1 + a by linarith), Real.sqrt_nonneg (1 + a)]