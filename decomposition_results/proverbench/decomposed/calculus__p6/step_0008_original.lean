theorem h2 (h1 : HasDerivAt (fun x => cos (x ^ 3)) (-sin (sorry ^ 3) * (3 * sorry ^ 2)) sorry) : deriv (fun x => cos (x ^ 3)) sorry = -sin (sorry ^ 3) * (3 * sorry ^ 2) :=
  by
  apply HasDerivAt.deriv
  exact h1