theorem h₅ (x : ℝ) (h₃ : HasDerivAt (fun x => x + 1) 1 x) : HasDerivAt (fun x => 5 * x ^ 2 + 35) (10 * x) x := by
  simpa using (hasDerivAt_pow 2 x).const_mul 5 |>.add_const 35