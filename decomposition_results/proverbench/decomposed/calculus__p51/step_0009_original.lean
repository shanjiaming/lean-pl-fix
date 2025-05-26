theorem h₇ (x : ℝ) (hx : x ∈ Set.Icc 0 (π / 4)) (h₅ : HasDerivAt (fun x => 18 / 25 * x) (18 / 25) x) : HasDerivAt (fun x => 4 * sin x + 3 * cos x) (4 * cos x - 3 * sin x) x := by
  convert
      HasDerivAt.add (HasDerivAt.const_mul 4 (Real.hasDerivAt_sin x))
        (HasDerivAt.const_mul 3 (Real.hasDerivAt_cos x)) using
      1 <;>
    ring