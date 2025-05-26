theorem h1  : HasDerivAt (fun x => x ^ 3) (3 * sorry ^ 2) sorry := by -- simpa using (hasDerivAt_pow 3 x)
  hole