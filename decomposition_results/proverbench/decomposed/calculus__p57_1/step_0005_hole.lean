theorem h₃ (x✝ x : ℝ) : HasDerivAt (fun x => x + 1) 1 x := by simpa using (hasDerivAt_id x).add_const (1 : ℝ)
  hole