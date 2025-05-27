theorem h₂₃ (h₀₅ : (fun x => (Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) = fun x => -2 * (Real.sin (x - 3) / (x - 3)) ^ 2) (h₀₉ : Tendsto (fun x => Real.sin x / x) (𝓝[≠] 0) (𝓝 1)) (h₁₂ h₁₉ : Tendsto (fun x => x - 3) (𝓝[≠] 3) (𝓝 0)) (x : ℝ) (hx : x ∈ {3}ᶜ) (h₂₂ : x ≠ 3) : x - 3 ≠ 0 := by
  intro h₂₄
  apply h₂₂
  linarith