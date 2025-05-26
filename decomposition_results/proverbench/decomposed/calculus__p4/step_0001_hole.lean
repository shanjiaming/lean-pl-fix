theorem limit_of_function_at_3  : sorry :=
  by
  have h₀ : Tendsto (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) (𝓝 3) (𝓝 (-2)) := by sorry
  have h₁ : Tendsto (fun x : ℝ => (1 : ℝ) / x) (𝓝 3) (𝓝 (1 / 3)) := by sorry
  have h₂ : Tendsto (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x ^ 3 - 6 * x ^ 2 + 9 * x)) (𝓝 3) (𝓝 (-2 / 3)) := by sorry
  --  exact h₂
  hole