theorem h_deriv_tendsto (y : ℝ → ℝ) (ycontdiff : ContDiff ℝ 1 y) (limy : Tendsto (fun x => deriv y x ^ 2 + y x ^ 3) atTop (𝓝 0)) (h_y_tendsto : Tendsto y atTop (𝓝 0)) : Tendsto (deriv y) atTop (𝓝 0) :=
  by
  have h₁ : Tendsto (fun x : ℝ => (deriv y x) ^ 2) atTop (𝓝 0) := by sorry
  have h₂ : Tendsto (deriv y) atTop (𝓝 0) := by sorry
  exact h₂