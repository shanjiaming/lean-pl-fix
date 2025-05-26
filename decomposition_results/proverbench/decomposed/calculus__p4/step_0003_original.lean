theorem h₀₁  : sorry :=
  by
  have h₀₂ : Tendsto (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) (𝓝 3) (𝓝 (-2)) := by sorry
  exact h₀₂