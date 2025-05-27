theorem h₄ (a b : ℝ) (f : ℝ → ℝ) (hf : DifferentiableOn ℝ f (Ioo a b)) (x₁ x₂ : ℝ) (hx₁ : x₁ ∈ Ioo a b) (hx₂ : x₂ ∈ Ioo a b) (h₁ : x₁ ≠ x₂ → ∃ ξ ∈ Ioo (min x₁ x₂) (max x₁ x₂), f x₁ - f x₂ = (x₁ - x₂) * deriv f ξ) (h : x₁ = x₂) (h' : ¬x₁ < x₂) (h₃ : x₁ ≤ x₂) : x₁ = x₂ := by
  --  apply le_antisymm
  --  · linarith
  --  · linarith
  hole