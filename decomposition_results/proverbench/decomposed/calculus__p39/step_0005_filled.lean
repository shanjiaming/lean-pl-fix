theorem h2 (x C : ℝ) (h1 : False) : ∫ (x : ℝ), sin x ^ 10 * cos x = sin x ^ 11 / 11 + C :=
  by
  --  exfalso
  --  exact h1
  norm_cast