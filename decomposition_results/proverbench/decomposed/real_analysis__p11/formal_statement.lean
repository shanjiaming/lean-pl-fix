/-- Theorem: If `f` is differentiable on `(a, b)`, then for any `x₁, x₂ ∈ (a, b)`, there exists `ξ` between `x₁` and `x₂` such that `f(x₁) - f(x₂) = (x₁ - x₂) f'(ξ)`. -/
theorem mean_value_theorem_for_differences (hf : DifferentiableOn ℝ f (Ioo a b))
  {x₁ x₂ : ℝ} (hx₁ : x₁ ∈ Ioo a b) (hx₂ : x₂ ∈ Ioo a b) :
  ∃ ξ ∈ Ioo (min x₁ x₂) (max x₁ x₂), f x₁ - f x₂ = (x₁ - x₂) * deriv f ξ :=