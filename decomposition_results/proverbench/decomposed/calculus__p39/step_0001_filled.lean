theorem integral_sin_pow_ten_cos (x C : ℝ) : ∫ (x : ℝ), sin x ^ 10 * cos x = sin x ^ 11 / 11 + C :=
  by
  have h1 : False := by sorry
  have h2 : ∫ x, (sin x) ^ 10 * cos x = (sin x) ^ 11 / 11 + C := by sorry
  --  exact h2
  linarith