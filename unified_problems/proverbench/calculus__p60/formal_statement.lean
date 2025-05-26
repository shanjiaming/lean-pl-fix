theorem limit_of_function_at_zero :
Tendsto (fun x => Real.sin (3 * x + x^2) / (5 * x + 2 * x^2)) (𝓝 0) (𝓝 (3 / 5)) :=