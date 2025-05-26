theorem main_theorem (hf : ContinuousOn f open_unit_interval)
  (h_lim : Tendsto f (𝓝[≠] 0) (𝓝 0))
  (h_diff : DifferentiableAt ℝ f 0)
  (h_deriv : deriv f 0 = m) :
  Tendsto (λ x => f x / x) (𝓝[≠] 0) (𝓝 m) :=