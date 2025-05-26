theorem derivative_of_f (x : ℝ) : HasDerivAt sorry (2 * (1 / cos x) ^ 2 * tan x) x :=
  by
  have h_main : HasDerivAt f (2 * (1 / cos x) ^ 2 * tan x) x := by sorry
  exact h_main