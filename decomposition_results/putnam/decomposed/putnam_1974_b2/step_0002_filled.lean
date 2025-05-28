theorem h_y_tendsto (y : ℝ → ℝ) (ycontdiff : ContDiff ℝ 1 y) (limy : Tendsto (fun x => deriv y x ^ 2 + y x ^ 3) atTop (𝓝 0)) : Tendsto y atTop (𝓝 0) :=
  by
  have h₁ : Tendsto (fun x : ℝ => (y x) ^ 3) atTop (𝓝 0) := by sorry
  have h₂ : Tendsto y atTop (𝓝 0) := by sorry
  --  exact h₂
  simpa