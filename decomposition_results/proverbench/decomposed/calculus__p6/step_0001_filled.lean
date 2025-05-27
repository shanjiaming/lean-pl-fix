theorem cosX3_derivative (x : ℝ) : deriv (fun x => Real.cos (x ^ 3)) x = -Real.sin (x ^ 3) * (3 * x ^ 2) :=
  by
  have h1 : HasDerivAt (fun x : ℝ => Real.cos (x ^ 3)) (-Real.sin (x ^ 3) * (3 * x ^ 2)) x := by sorry
  have h2 : deriv (fun x : ℝ => Real.cos (x ^ 3)) x = -Real.sin (x ^ 3) * (3 * x ^ 2) := by sorry
  --  apply h2
  norm_num