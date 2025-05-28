theorem h4 (f : ℝ → ℝ) (hfdiff : ContDiff ℝ 2 f) (hfbd : ∀ (x : ℝ), |f x| ≤ 1) (hf0 : f 0 ^ 2 + deriv f 0 ^ 2 = 4) (h2 : ContDiff ℝ 1 f) (h3 : Differentiable ℝ f) : Differentiable ℝ (deriv f) :=
  by
  have h5 : ContDiff ℝ 1 (deriv f) := by sorry
  --  exact h5.differentiable (by norm_num)
  hole