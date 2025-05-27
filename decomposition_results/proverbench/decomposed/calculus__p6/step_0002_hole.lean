theorem h1 (x : ℝ) : HasDerivAt (fun x => Real.cos (x ^ 3)) (-Real.sin (x ^ 3) * (3 * x ^ 2)) x :=
  by
  have h1 : HasDerivAt (fun x : ℝ => x ^ 3) (3 * x ^ 2) x := by sorry
  have h2 : HasDerivAt (fun x : ℝ => Real.cos (x ^ 3)) (-Real.sin (x ^ 3) * (3 * x ^ 2)) x := by sorry
  --  exact h2
  hole