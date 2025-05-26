theorem cosine_derivative_formula (x : ℝ) : deriv (fun x => cos (3 * x + x ^ 2)) x = -sin (3 * x + x ^ 2) * (3 + 2 * x) :=
  by
  have h1 : HasDerivAt (fun x : ℝ => cos (3 * x + x ^ 2)) (-sin (3 * x + x ^ 2) * (3 + 2 * x)) x := by sorry
  have h2 : deriv (fun x : ℝ => cos (3 * x + x ^ 2)) x = -sin (3 * x + x ^ 2) * (3 + 2 * x) := by sorry
  --  apply h2
  linarith