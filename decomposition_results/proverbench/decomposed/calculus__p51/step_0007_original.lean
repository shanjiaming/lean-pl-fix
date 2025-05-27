theorem h₅ (x✝ x : ℝ) (hx : x ∈ Set.Icc 0 (π / 4)) : HasDerivAt (fun x => 18 / 25 * x) (18 / 25) x := by
  simpa using (hasDerivAt_id x).const_mul (18 / 25 : ℝ)