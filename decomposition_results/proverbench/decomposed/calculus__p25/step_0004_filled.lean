theorem h1 (x : ℝ) : HasDerivAt (fun x => 3 * x + x ^ 2) (3 + 2 * x) x :=
  by
  have h2 : HasDerivAt (fun x : ℝ => 3 * x) 3 x := by sorry
  have h3 : HasDerivAt (fun x : ℝ => x ^ 2) (2 * x) x := by sorry
  have h4 : HasDerivAt (fun x : ℝ => 3 * x + x ^ 2) (3 + 2 * x) x := by sorry
  --  exact h4
  simpa