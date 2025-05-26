theorem h_deriv_tendsto (y : ℝ → ℝ) (ycontdiff : ContDiff ℝ 1 y) (limy : sorry) (h_y_tendsto : sorry) : sorry :=
  by
  have h₁ : Tendsto (fun x : ℝ => (deriv y x) ^ 2) atTop (𝓝 0) := by sorry
  have h₂ : Tendsto (deriv y) atTop (𝓝 0) := by sorry
  --  exact h₂
  hole