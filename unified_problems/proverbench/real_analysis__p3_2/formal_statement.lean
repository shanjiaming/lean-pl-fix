theorem limit_quotient_eq_deriv (hf : ContinuousOn f open_unit_interval)
  (h_zero : f 0 = 0)
  (h_diff : DifferentiableAt ℝ f 0) :
  Tendsto (λ x => f x / x) (𝓝[≠] 0) (𝓝 (deriv f 0)) :=