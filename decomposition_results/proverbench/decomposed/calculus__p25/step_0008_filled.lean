theorem h2 (x : ℝ) (h1 : HasDerivAt (fun x => 3 * x + x ^ 2) (3 + 2 * x) x) : HasDerivAt (fun x => cos (3 * x + x ^ 2)) (-sin (3 * x + x ^ 2) * (3 + 2 * x)) x :=
  by
  have h3 : HasDerivAt (fun x : ℝ => cos (3 * x + x ^ 2)) (-sin (3 * x + x ^ 2) * (3 + 2 * x)) x := by sorry
  --  exact h3
  hole