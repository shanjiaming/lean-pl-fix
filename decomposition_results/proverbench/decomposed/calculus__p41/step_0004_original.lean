theorem h₂ (x : ℝ) (h₁ : Tendsto (fun y => (Real.exp y - 1) / y) (𝓝 0) (𝓝 1)) : Tendsto (fun x => 8 * x) (𝓝[>] 0) (𝓝 0) :=
  by
  have h₃ : Continuous (fun x : ℝ => 8 * x) := by sorry
  have h₄ : Tendsto (fun x : ℝ => 8 * x) (𝓝[Set.Ioi 0] 0) (𝓝 (8 * 0)) := by sorry
  simpa [mul_zero] using h₄