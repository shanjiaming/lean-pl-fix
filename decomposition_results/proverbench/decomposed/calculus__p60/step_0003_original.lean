theorem h₁  : sorry :=
  by
  have h₂ : Tendsto (fun x : ℝ => (3 + x) / (5 + 2 * x)) (𝓝 0) (𝓝 (3 / 5)) := by sorry
  have h₄ : Tendsto (fun x : ℝ => (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝[≠] 0) (𝓝 (3 / 5)) := by sorry
  exact h₄