theorem h₀  : Tendsto (fun x => (Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) (𝓝 3) (𝓝 (-2)) :=
  by
  have h₀₁ : Tendsto (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) (𝓝 3) (𝓝 (-2)) := by sorry
  exact h₀₁