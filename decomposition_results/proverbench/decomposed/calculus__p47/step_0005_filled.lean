theorem h₃ (x : ℝ) : HasDerivAt (fun x => x ^ 2 + 1) (2 * x) x := by -- simpa using (hasDerivAt_pow 2 x).add_const (1 : ℝ)
  hole