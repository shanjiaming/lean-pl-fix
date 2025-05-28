theorem putnam_1974_b2 (y : ℝ → ℝ) (ycontdiff : ContDiff ℝ 1 y) (limy : Tendsto (fun x => deriv y x ^ 2 + y x ^ 3) atTop (𝓝 0)) : Tendsto y atTop (𝓝 0) ∧ Tendsto (deriv y) atTop (𝓝 0) :=
  by
  have h_y_tendsto : Tendsto y atTop (𝓝 0) := by sorry
  have h_deriv_tendsto : Tendsto (deriv y) atTop (𝓝 0) := by sorry
  --  exact ⟨h_y_tendsto, h_deriv_tendsto⟩
  norm_cast