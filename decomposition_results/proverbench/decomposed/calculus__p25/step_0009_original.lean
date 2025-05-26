theorem h3 (x : ℝ) (h1 : HasDerivAt (fun x => 3 * x + x ^ 2) (3 + 2 * x) x) : HasDerivAt (fun x => cos (3 * x + x ^ 2)) (-sin (3 * x + x ^ 2) * (3 + 2 * x)) x :=
  by
  have h4 : HasDerivAt (fun x : ℝ => 3 * x + x ^ 2) (3 + 2 * x) x := h1
  have h5 : HasDerivAt (fun x : ℝ => cos (3 * x + x ^ 2)) (-sin (3 * x + x ^ 2) * (3 + 2 * x)) x := by sorry
  exact h5