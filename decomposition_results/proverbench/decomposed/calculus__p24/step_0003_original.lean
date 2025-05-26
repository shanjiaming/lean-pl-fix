theorem h₁  : sorry :=
  by
  have h₂ : Tendsto (fun x : ℝ => x ^ 3 : ℝ → ℝ) atTop atTop := by sorry
  have h₃ : Tendsto (fun x : ℝ => 3 * x ^ 3 : ℝ → ℝ) atTop atTop := by sorry
  have h₄ : Tendsto (fun x : ℝ => x + 3 * x ^ 3 : ℝ → ℝ) atTop atTop := by sorry
  simpa using h₄