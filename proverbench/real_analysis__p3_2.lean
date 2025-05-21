theorem limit_quotient_eq_deriv (hf : ContinuousOn f open_unit_interval)
  (h_zero : f 0 = 0)
  (h_diff : DifferentiableAt ℝ f 0) :
  Tendsto (λ x => f x / x) (𝓝[≠] 0) (𝓝 (deriv f 0)) := by
  have h_cont : ContinuousAt f 0 := by
    exact h_diff.continuousAt
  
  have h_tendsto : Tendsto f (𝓝 0) (𝓝 0) := by
    have h₁ : Tendsto f (𝓝 0) (𝓝 (f 0)) := h_cont.tendsto
    rw [h_zero] at h₁
    exact h₁
  
  have h_tendsto' : Tendsto f (𝓝[≠] 0) (𝓝 0) := by
    have h₂ : Tendsto f (𝓝[≠] 0) (𝓝 0) := h_tendsto.mono_left nhdsWithin_le_nhds
    exact h₂
  
  have h_main : Tendsto (λ x => f x / x) (𝓝[≠] 0) (𝓝 (deriv f 0)) := by
    have h₃ : Tendsto (λ x => f x / x) (𝓝[≠] 0) (𝓝 (deriv f 0)) := by
      apply main_theorem f (deriv f 0) hf h_tendsto' h_diff
      <;> simp [h_zero]
    exact h₃
  
  exact h_main