theorem h5 (x : ℝ) (h1 h4 : HasDerivAt (fun x => 3 * x + x ^ 2) (3 + 2 * x) x) : HasDerivAt (fun x => cos (3 * x + x ^ 2)) (-sin (3 * x + x ^ 2) * (3 + 2 * x)) x :=
  by
  have h6 : HasDerivAt (fun x : ℝ => cos (3 * x + x ^ 2)) (-sin (3 * x + x ^ 2) * (3 + 2 * x)) x := by sorry
  --  exact h6
  norm_cast