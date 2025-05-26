theorem h1 (x : ℝ) : HasDerivAt (fun x => cos (3 * x + x ^ 2)) (-sin (3 * x + x ^ 2) * (3 + 2 * x)) x :=
  by
  have h1 : HasDerivAt (fun x : ℝ => 3 * x + x ^ 2) (3 + 2 * x) x := by sorry
  have h2 : HasDerivAt (fun x : ℝ => cos (3 * x + x ^ 2)) (-sin (3 * x + x ^ 2) * (3 + 2 * x)) x := by sorry
  exact h2