theorem h3 (x : ℝ) (h2 : ∫ (x : ℝ), Real.sin x ^ 3 * Real.cos x ^ 6 = ∫ (x : ℝ), Real.sin x * Real.cos x ^ 6 - Real.sin x * Real.cos x ^ 8) : ∫ (x : ℝ), Real.sin x * Real.cos x ^ 6 - Real.sin x * Real.cos x ^ 8 =
    (∫ (x : ℝ), Real.sin x * Real.cos x ^ 6) - ∫ (x : ℝ), Real.sin x * Real.cos x ^ 8 :=
  by apply Integral_sub (integrable_sin_mul_cos_pow 6) (integrable_sin_mul_cos_pow 8)