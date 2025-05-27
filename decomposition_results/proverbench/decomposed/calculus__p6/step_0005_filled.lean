theorem h4 (x : ℝ) (h1 h3 : HasDerivAt (fun x => x ^ 3) (3 * x ^ 2) x) : HasDerivAt (fun x => Real.cos (x ^ 3)) (-Real.sin (x ^ 3) * (3 * x ^ 2)) x :=
  by
  have h5 : HasDerivAt (fun x : ℝ => x ^ 3) (3 * x ^ 2) x := h3
  have h6 : HasDerivAt (fun x : ℝ => Real.cos (x ^ 3)) (-Real.sin (x ^ 3) * (3 * x ^ 2)) x := by sorry
  --  exact h6
  norm_cast