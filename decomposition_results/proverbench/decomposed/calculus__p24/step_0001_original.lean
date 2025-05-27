theorem limit_of_sin_fraction_as_x_approaches_infinity  : Tendsto (fun x => sin (2 * x + x ^ 3) / (x + 3 * x ^ 3)) atTop (𝓝 0) :=
  by
  have h_main : Tendsto (fun x : ℝ => sin (2 * x + x ^ 3) / (x + 3 * x ^ 3)) atTop (𝓝 0) := by sorry
  exact h_main