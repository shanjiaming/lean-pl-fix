theorem h₂₁ (h₀₅ : (fun x => (Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) = fun x => -2 * (Real.sin (x - 3) / (x - 3)) ^ 2) (h₀₉ : Tendsto (fun x => Real.sin x / x) (𝓝[≠] 0) (𝓝 1)) (h₁₂ h₁₉ : Tendsto (fun x => x - 3) (𝓝[≠] 3) (𝓝 0)) : Tendsto (fun x => x - 3) (𝓝[≠] 3) (𝓝[≠] 0) :=
  by
  --  apply tendsto_nhdsWithin_of_tendsto_nhds_of_eventually_within
  --  · exact h₁₉
  --  · filter_upwards [self_mem_nhdsWithin] with x hx
    have h₂₂ : x ≠ 3 := hx
    have h₂₃ : x - 3 ≠ 0 := by sorry
  --    exact h₂₃
  hole