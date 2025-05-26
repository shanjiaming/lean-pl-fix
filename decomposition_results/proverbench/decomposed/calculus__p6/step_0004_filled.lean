theorem h2 (h1 : HasDerivAt (fun x => x ^ 3) (3 * sorry ^ 2) sorry) : HasDerivAt (fun x => cos (x ^ 3)) (-sin (sorry ^ 3) * (3 * sorry ^ 2)) sorry :=
  by
  have h3 : HasDerivAt (fun x : ℝ => x ^ 3) (3 * x ^ 2) x := h1
  have h4 : HasDerivAt (fun x : ℝ => Real.cos (x ^ 3)) (-Real.sin (x ^ 3) * (3 * x ^ 2)) x := by sorry
  --  exact h4
  hole