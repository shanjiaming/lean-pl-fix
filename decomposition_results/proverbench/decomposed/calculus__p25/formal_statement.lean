theorem cosine_derivative_formula (x : ℝ) :
  deriv (fun x => cos (3 * x + x^2)) x = -sin (3 * x + x^2) * (3 + 2 * x) :=