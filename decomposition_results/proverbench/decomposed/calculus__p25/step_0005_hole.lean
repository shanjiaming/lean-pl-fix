theorem h2 (x : ℝ) : HasDerivAt (fun x => 3 * x) 3 x := by -- simpa using (hasDerivAt_id x).const_mul 3
  hole