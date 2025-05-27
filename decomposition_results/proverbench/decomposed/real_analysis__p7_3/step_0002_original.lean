theorem h_main (x : ℝ) : ∀ x ∈ Set.Ioo 0 8, DifferentiableAt ℝ f x :=
  by
  intro x hx
  have h₁ : HasDerivAt f ((1 / 3 : ℝ) * (8 * x - x ^ 2) ^ (-2 / 3 : ℝ) * (8 - 2 * x)) x := by sorry
  have h₂ : DifferentiableAt ℝ f x := h₁.differentiableAt
  exact h₂