theorem limit_of_function_at_zero  : sorry :=
  by
  have h_main : Tendsto (fun x => (1 - (Real.cos x) ^ (Real.sin x)) / x ^ 3) (𝓝[≠] 0) (𝓝 (1 / 2)) := by sorry
  have h_final : Tendsto (fun x => (1 - (Real.cos x) ^ (Real.sin x)) / x ^ 3) (𝓝 0) (𝓝 (1 / 2)) := by sorry
  exact h_final