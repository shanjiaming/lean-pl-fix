theorem h₂ (h₀ : HasDerivAt (fun x => 3 ^ x) (Real.log 3) 0) : sorry :=
  by
  have h₃ : Tendsto (fun x => ((3 : ℝ) ^ x - (3 : ℝ) ^ (0 : ℝ)) / (x - 0)) (𝓝[≠] 0) (𝓝 (Real.log 3)) := by sorry
  --  exact h₃
  hole