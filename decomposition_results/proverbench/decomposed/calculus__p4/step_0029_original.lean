theorem h₂₆ (h₀ : sorry) (h₁ : sorry) (h₂₁ : sorry) (h₂₂ : sorry) (h₂₃ :  (fun x => (cos (2 * x - 6) - 1) / (x ^ 3 - 6 * x ^ 2 + 9 * x)) =ᶠ[𝓝 3] fun x =>    (cos (2 * x - 6) - 1) / (x - 3) ^ 2 * (1 / x)) : sorry :=
  by
  have h₂₇ :
    Tendsto (fun x : ℝ => ((Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) * ((1 : ℝ) / x)) (𝓝 3) (𝓝 ((-2 : ℝ) * (1 / 3))) := by sorry
  have h₃₃ : ((-2 : ℝ) * (1 / 3) : ℝ) = (-2 / 3 : ℝ) := by sorry
  rw [h₃₃] at h₂₇
  exact h₂₇