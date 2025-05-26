theorem h1  : sorry :=
  by
  have h₁ : Tendsto (fun x : ℝ => (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝[≠] 0) (𝓝 (3 / 5)) := by sorry
  have h₂ : Tendsto (fun x : ℝ => (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝 0) (𝓝 (3 / 5)) := by sorry
  exact h₂