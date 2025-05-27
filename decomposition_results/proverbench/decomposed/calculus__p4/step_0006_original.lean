theorem h₀₄  : Tendsto (fun x => (Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) (𝓝[≠] 3) (𝓝 (-2)) :=
  by
  have h₀₅ :
    (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) =
      (fun x : ℝ => (-2 : ℝ) * ((Real.sin (x - 3)) / (x - 3)) ^ 2) := by sorry
  rw [h₀₅]
  have h₀₆ : Tendsto (fun x : ℝ => (-2 : ℝ) * ((Real.sin (x - 3)) / (x - 3)) ^ 2) (𝓝[≠] 3) (𝓝 (-2)) := by sorry
  exact h₀₆