theorem limit_of_function_as_x_approaches_zero  : Tendsto (fun x => (3 ^ x - 1) / x) (𝓝[≠] 0) (𝓝 (Real.log 3)) :=
  by
  have h₀ : HasDerivAt (fun x : ℝ => (3 : ℝ) ^ x) (Real.log 3) 0 := by sorry
  have h₁ : Tendsto (fun x => (3 ^ x - 1) / x) (𝓝[≠] 0) (𝓝 (Real.log 3)) := by sorry
  --  exact h₁
  simpa