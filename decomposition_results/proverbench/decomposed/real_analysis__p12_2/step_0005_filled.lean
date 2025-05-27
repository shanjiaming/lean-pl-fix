theorem h₄ (x✝ x : ℕ → ℝ) (L : ℝ) (hL h₃ : Tendsto x atTop (𝓝 L)) : Tendsto (fun n => x n - L) atTop (𝓝 0) := by simpa using hL.sub tendsto_const_nhds
  hole