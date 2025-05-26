theorem h₁ (y : ℝ → ℝ) (ycontdiff : ContDiff ℝ 1 y) (limy : sorry) (h_y_tendsto : sorry) : sorry :=
  by
  have h₂ : Tendsto (fun x : ℝ => (deriv y x) ^ 2 + (y x) ^ 3) atTop (𝓝 0) := limy
  have h₃ : Tendsto (fun x : ℝ => (y x) ^ 3) atTop (𝓝 0) := by sorry
  have h₄ : Tendsto (fun x : ℝ => (deriv y x) ^ 2) atTop (𝓝 0) := by sorry
  exact h₄