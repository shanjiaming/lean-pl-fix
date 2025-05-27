theorem h₁ (h₀ : Tendsto (fun x => (Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) (𝓝 3) (𝓝 (-2))) : Tendsto (fun x => 1 / x) (𝓝 3) (𝓝 (1 / 3)) :=
  by
  have h₁₁ : Tendsto (fun x : ℝ => (1 : ℝ) / x) (𝓝 3) (𝓝 (1 / 3)) := by sorry
  --  exact h₁₁
  hole