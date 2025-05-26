theorem h₀₂  : sorry :=
  by
  have h₀₃ : Tendsto (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) (𝓝[≠] 3) (𝓝 (-2)) := by sorry
  have h₀₅ : Tendsto (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) (𝓝 3) (𝓝 (-2)) := by sorry
  --  exact h₀₅
  hole