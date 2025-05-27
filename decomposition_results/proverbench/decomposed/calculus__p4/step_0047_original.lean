theorem h₁₂ (h₀ : Tendsto (fun x => (Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) (𝓝 3) (𝓝 (-2))) : ContinuousAt (fun x => 1 / x) 3 :=
  by
  apply ContinuousAt.div
  · exact continuousAt_const
  · exact continuousAt_id
  · norm_num