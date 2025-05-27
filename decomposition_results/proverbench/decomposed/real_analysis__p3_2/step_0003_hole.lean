theorem h_tendsto (f : ℝ → ℝ) (m : ℝ) (hf : ContinuousOn f open_unit_interval) (h_zero : f 0 = 0) (h_diff : DifferentiableAt ℝ f 0) (h_cont : ContinuousAt f 0) : Tendsto f (𝓝 0) (𝓝 0) :=
  by
  have h₁ : Tendsto f (𝓝 0) (𝓝 (f 0)) := h_cont.tendsto
  --  rw [h_zero] at h₁
  --  exact h₁
  hole