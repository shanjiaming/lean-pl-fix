theorem h2 (x : ℝ) (h1 : HasDerivAt (fun x => x ^ 3) (3 * x ^ 2) x) : HasDerivAt (fun x => Real.cos (x ^ 3)) (-Real.sin (x ^ 3) * (3 * x ^ 2)) x :=
  by
  have h3 : HasDerivAt (fun x : ℝ => x ^ 3) (3 * x ^ 2) x := h1
  have h4 : HasDerivAt (fun x : ℝ => Real.cos (x ^ 3)) (-Real.sin (x ^ 3) * (3 * x ^ 2)) x := by sorry
  --  exact h4
  norm_cast