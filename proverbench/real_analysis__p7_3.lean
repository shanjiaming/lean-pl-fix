theorem f_differentiable : DifferentiableOn ℝ f (Set.Ioo 0 8) := by
  have h_main : ∀ (x : ℝ), x ∈ Set.Ioo 0 8 → DifferentiableAt ℝ f x := by
    intro x hx
    have h₁ : HasDerivAt f ((1/3 : ℝ) * (8 * x - x ^ 2) ^ (-2 / 3 : ℝ) * (8 - 2 * x)) x := by
      apply derivative_f x hx
    -- Use the fact that having a derivative implies differentiability at a point.
    have h₂ : DifferentiableAt ℝ f x := h₁.differentiableAt
    exact h₂
  
  have h_final : DifferentiableOn ℝ f (Set.Ioo 0 8) := by
    intro x hx
    exact h_main x hx
  
  exact h_final