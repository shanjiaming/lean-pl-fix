theorem h₀₅ (h₀₃ : Tendsto (fun x => (Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) (𝓝[≠] 3) (𝓝 (-2))) : Tendsto (fun x => (Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) (𝓝 3) (𝓝 (-2)) :=
  by
  have h₀₆ : Tendsto (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) (𝓝[≠] 3) (𝓝 (-2)) := h₀₃
  have h₀₇ : Tendsto (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) (𝓝 3) (𝓝 (-2)) := by sorry
  --  exact h₀₇
  hole