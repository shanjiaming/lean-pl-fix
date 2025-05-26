theorem h₂₅ (h₀ : sorry) (h₁ : sorry) (h₂₁ : sorry) (h₂₂ : sorry) (h₂₃ :  (fun x => (cos (2 * x - 6) - 1) / (x ^ 3 - 6 * x ^ 2 + 9 * x)) =ᶠ[𝓝 3] fun x =>    (cos (2 * x - 6) - 1) / (x - 3) ^ 2 * (1 / x)) : sorry :=
  by
  have h₂₆ : Tendsto (fun x : ℝ => ((Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) * ((1 : ℝ) / x)) (𝓝 3) (𝓝 (-2 / 3)) := by sorry
  have h₃₄ : Tendsto (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x ^ 3 - 6 * x ^ 2 + 9 * x)) (𝓝 3) (𝓝 (-2 / 3)) := by sorry
  --  exact h₃₄
  hole