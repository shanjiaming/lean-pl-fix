theorem putnam_2020_a6
  (f : ℤ → (ℝ → ℝ))
  (hf : f = fun N : ℤ => fun x : ℝ =>
    ∑ n in Finset.Icc 0 N, (N + 1/2 - n)/((N + 1)*(2*n + 1)) * Real.sin ((2*n + 1)*x))
  : ((Real.pi / 4) : ℝ ) = sSup {y | ∃ᵉ (N > 0) (x : ℝ), y = f N x} := by