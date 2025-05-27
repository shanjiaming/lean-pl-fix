theorem h₁ (x δ : ℝ) (hδ : 0 < δ) (hδ' : ∀ (x : ℝ), |x - 2| < δ → f x ≤ f 2) (y : ℝ) (hy : y ∈ Metric.ball 2 δ) : |y - 2| < δ := by
  rw [Metric.mem_ball] at hy
  simpa [Real.dist_eq] using hy