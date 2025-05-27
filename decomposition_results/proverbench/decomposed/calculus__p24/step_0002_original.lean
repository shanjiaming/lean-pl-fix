theorem h_main  : Tendsto (fun x => sin (2 * x + x ^ 3) / (x + 3 * x ^ 3)) atTop (𝓝 0) :=
  by
  have h₁ : Tendsto (fun x : ℝ => x + 3 * x ^ 3 : ℝ → ℝ) atTop atTop := by sorry
  have h₂ : Tendsto (fun x : ℝ => sin (2 * x + x ^ 3) / (x + 3 * x ^ 3)) atTop (𝓝 0) := by sorry
  exact h₂