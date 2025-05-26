theorem h6 (h1 : HasDerivAt (fun x => x ^ 3) (3 * sorry ^ 2) sorry) (h3 : HasDerivAt (fun x => x ^ 3) (3 * sorry ^ 2) sorry) (h5 : HasDerivAt (fun x => x ^ 3) (3 * sorry ^ 2) sorry) : HasDerivAt (fun x => cos (x ^ 3)) (-sin (sorry ^ 3) * (3 * sorry ^ 2)) sorry :=
  by
  have h7 : HasDerivAt (fun x : ℝ => x ^ 3) (3 * x ^ 2) x := h5
  have h8 : HasDerivAt (fun x : ℝ => Real.cos (x ^ 3)) (-Real.sin (x ^ 3) * (3 * x ^ 2)) x := by sorry
  exact h8