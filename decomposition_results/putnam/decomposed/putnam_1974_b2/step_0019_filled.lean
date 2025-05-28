theorem h₂ (y : ℝ → ℝ) (ycontdiff : ContDiff ℝ 1 y) (limy : Tendsto (fun x => deriv y x ^ 2 + y x ^ 3) atTop (𝓝 0)) (h₁ : Tendsto (fun x => y x ^ 3) atTop (𝓝 0)) : Tendsto y atTop (𝓝 0) :=
  by
  have h₃ : Tendsto (fun x : ℝ => (y x) ^ 3) atTop (𝓝 0) := h₁
  have h₄ : Tendsto y atTop (𝓝 0) := by sorry
  --  exact h₄
  simpa