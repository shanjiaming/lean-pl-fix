theorem h6 (h1 : sorry) (h2 : sorry) (h5 : sorry) : sorry :=
  by
  have h7 : Tendsto (fun x : ℝ => (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝 0) (𝓝 (3 / 5)) := h1
  have h8 : Tendsto (fun x : ℝ => (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝[≠] 0) (𝓝 (3 / 5)) :=
    h7.mono_left nhdsWithin_le_nhds
  exact h8