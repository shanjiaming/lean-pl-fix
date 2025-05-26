theorem h₁  : sorry :=
  by
  have h₂ : Tendsto (fun y : ℝ => (Real.exp y - 1) / y) (𝓝 0) (𝓝 1) := by
    simpa using Real.tendsto_exp_sub_one_div_at_zero
  have h₂ : Tendsto (fun y : ℝ => (Real.exp y - 1) / y) (𝓝 0) (𝓝 1) := by sorry
have h₁ : Tendsto (fun y : ℝ => (Real.exp y - 1) / y) (𝓝 0) (𝓝 1) :=
  by
  have h₂ : Tendsto (fun y : ℝ => (Real.exp y - 1) / y) (𝓝 0) (𝓝 1) := by
    simpa using Real.tendsto_exp_sub_one_div_at_zero
  exact h₂