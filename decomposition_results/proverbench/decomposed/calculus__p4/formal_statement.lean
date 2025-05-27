theorem limit_of_function_at_3 :
Tendsto (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x^3 - 6 * x^2 + 9 * x)) (𝓝 3) (𝓝 (-2 / 3)) :=