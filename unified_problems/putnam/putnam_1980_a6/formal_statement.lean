theorem putnam_1980_a6
    (C : Set (ℝ → ℝ))
    (hC : C = {f : ℝ → ℝ | ContDiffOn ℝ 1 f (Set.Icc 0 1) ∧ f 0 = 0 ∧ f 1 = 1}) :
    IsGreatest
      {(u : ℝ) | ∀ f ∈ C, u ≤ (∫ x in Set.Ioo 0 1, |deriv f x - f x|)}
      ((1 / Real.exp 1) : ℝ ) :=
  by