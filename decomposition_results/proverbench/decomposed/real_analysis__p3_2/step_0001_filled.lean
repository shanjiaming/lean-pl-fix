theorem limit_quotient_eq_deriv (f : ℝ → ℝ) (m : ℝ) (hf : ContinuousOn f open_unit_interval) (h_zero : f 0 = 0) (h_diff : DifferentiableAt ℝ f 0) : Tendsto (fun x => f x / x) (𝓝[≠] 0) (𝓝 (deriv f 0)) :=
  by
  have h_cont : ContinuousAt f 0 := by sorry
  have h_tendsto : Tendsto f (𝓝 0) (𝓝 0) := by sorry
  have h_tendsto' : Tendsto f (𝓝[≠] 0) (𝓝 0) := by sorry
  have h_main : Tendsto (λ x => f x / x) (𝓝[≠] 0) (𝓝 (deriv f 0)) := by sorry
  --  exact h_main
  simpa