theorem h₃ (y : ℝ → ℝ) (ycontdiff : ContDiff ℝ 1 y) (limy : Tendsto (fun x => deriv y x ^ 2 + y x ^ 3) atTop (𝓝 0)) (h_y_tendsto : Tendsto y atTop (𝓝 0)) (h₂ : Tendsto (fun x => deriv y x ^ 2 + y x ^ 3) atTop (𝓝 0)) : Tendsto (fun x => y x ^ 3) atTop (𝓝 0) :=
  by
  have h₄ : ∀ ε : ℝ, 0 < ε → (∀ᶠ x in atTop, |(y x) ^ 3| < ε) := by sorry
  have h₅₁₅ : Tendsto (fun x : ℝ => (y x) ^ 3) atTop (𝓝 0) := by sorry
  --  exact h₅₁₅
  simpa