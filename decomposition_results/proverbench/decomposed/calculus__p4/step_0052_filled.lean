theorem h₂₅ (h₀ : Tendsto (fun x => (Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) (𝓝 3) (𝓝 (-2))) (h₁ : Tendsto (fun x => 1 / x) (𝓝 3) (𝓝 (1 / 3))) (h₂₁ : Tendsto (fun x => (Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) (𝓝 3) (𝓝 (-2))) (h₂₂ : Tendsto (fun x => 1 / x) (𝓝 3) (𝓝 (1 / 3))) (x : ℝ) (hx : x ≠ 0) : x ≠ 0 := by
  --  intro h₂₅
  --  apply hx
  --  simp_all
  simpa