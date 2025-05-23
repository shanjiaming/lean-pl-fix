theorem main_theorem (hf : ContinuousOn f open_unit_interval)
  (h_lim : Tendsto f (𝓝[≠] 0) (𝓝 0))
  (h_diff : DifferentiableAt ℝ f 0)
  (h_deriv : deriv f 0 = m) :
  Tendsto (λ x => f x / x) (𝓝[≠] 0) (𝓝 m) := by
  have h₀ : f 0 = 0 := by sorry
  have h₁ : HasDerivAt f m 0 := by sorry
  have h₂ : Tendsto (λ x => f x / x) (𝓝[≠] 0) (𝓝 m) := by sorry
  exact h₂