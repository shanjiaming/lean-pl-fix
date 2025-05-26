theorem h2 (x : ℝ) (h1 : False) : ∫ (x : ℝ), 1 / cos x ^ 2 = tan x + sorry :=
  by
  exfalso
  exact h1