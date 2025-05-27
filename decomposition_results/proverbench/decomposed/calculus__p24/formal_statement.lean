theorem limit_of_sin_fraction_as_x_approaches_infinity :
Tendsto (fun x : ℝ => sin (2 * x + x^3) / (x + 3 * x^3)) atTop (𝓝 0) :=