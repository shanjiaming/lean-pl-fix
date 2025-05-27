theorem h₁₁ (h₀ : Tendsto (fun x => (Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) (𝓝 3) (𝓝 (-2))) : Tendsto (fun x => 1 / x) (𝓝 3) (𝓝 (1 / 3)) :=
  by
  have h₁₂ : ContinuousAt (fun x : ℝ => (1 : ℝ) / x) 3 := by sorry
  have h₁₃ : Tendsto (fun x : ℝ => (1 : ℝ) / x) (𝓝 3) (𝓝 ((1 : ℝ) / 3)) := by sorry
  --  simpa using h₁₃
  norm_num