theorem h2 (x : ℝ) (h1 : HasDerivAt (fun x => cos (3 * x + x ^ 2)) (-sin (3 * x + x ^ 2) * (3 + 2 * x)) x) : deriv (fun x => cos (3 * x + x ^ 2)) x = -sin (3 * x + x ^ 2) * (3 + 2 * x) :=
  by
  apply HasDerivAt.deriv
  exact h1