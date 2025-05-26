theorem h2 (x C : ℝ) (h1 : False) : ∫ (x : ℝ), 1 / cos x ^ 2 = tan x + C := by
  exfalso
  exact h1