theorem h₁ (y : ℝ → ℝ) (ycontdiff : ContDiff ℝ 1 y) (limy : Tendsto (fun x => deriv y x ^ 2 + y x ^ 3) atTop (𝓝 0)) : Tendsto (fun x => y x ^ 3) atTop (𝓝 0) :=
  by
  have h₂ : Tendsto (fun x : ℝ => (deriv y x) ^ 2 + (y x) ^ 3) atTop (𝓝 0) := limy
  have h₃ : Tendsto (fun x : ℝ => (y x) ^ 3) atTop (𝓝 0) := by sorry
  --  exact h₃
  simpa