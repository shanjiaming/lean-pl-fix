theorem h₂ (y : ℝ → ℝ) (ycontdiff : ContDiff ℝ 1 y) (limy : sorry) (h₁ : sorry) : sorry :=
  by
  have h₃ : Tendsto (fun x : ℝ => (y x) ^ 3) atTop (𝓝 0) := h₁
  have h₄ : Tendsto y atTop (𝓝 0) := by sorry
  --  exact h₄
  hole