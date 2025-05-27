theorem h2 (x : ℝ) (h1 : HasDerivAt (fun x => Real.cos (x ^ 3)) (-Real.sin (x ^ 3) * (3 * x ^ 2)) x) : deriv (fun x => Real.cos (x ^ 3)) x = -Real.sin (x ^ 3) * (3 * x ^ 2) :=
  by
  --  apply HasDerivAt.deriv
  --  exact h1
  hole