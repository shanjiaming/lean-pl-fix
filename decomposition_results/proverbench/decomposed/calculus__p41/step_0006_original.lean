theorem h₄ (x : ℝ) (h₁ : Tendsto (fun y => (Real.exp y - 1) / y) (𝓝 0) (𝓝 1)) (h₃ : Continuous fun x => 8 * x) : Tendsto (fun x => 8 * x) (𝓝[>] 0) (𝓝 (8 * 0)) :=
  by
  apply Tendsto.mono_left _ nhdsWithin_le_nhds
  exact h₃.continuousAt