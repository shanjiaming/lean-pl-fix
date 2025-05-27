theorem h6 (x : ℝ) (h1 h3 h5 : HasDerivAt (fun x => x ^ 3) (3 * x ^ 2) x) : HasDerivAt (fun x => Real.cos (x ^ 3)) (-Real.sin (x ^ 3) * (3 * x ^ 2)) x :=
  by
  have h7 : HasDerivAt (fun x : ℝ => x ^ 3) (3 * x ^ 2) x := h5
  have h8 : HasDerivAt (fun x : ℝ => Real.cos (x ^ 3)) (-Real.sin (x ^ 3) * (3 * x ^ 2)) x := by sorry
  exact h8