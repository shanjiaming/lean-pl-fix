theorem h₂ (a b : ℝ) (f : ℝ → ℝ) (hf : DifferentiableOn ℝ f (Ioo a b)) (x₁ x₂ : ℝ) (hx₁ : x₁ ∈ Ioo a b) (hx₂ : x₂ ∈ Ioo a b) (hne : x₁ ≠ x₂) : x₁ < x₂ ∨ x₂ < x₁ := by
  --  cases' lt_or_gt_of_ne hne with h h
  --  · exact Or.inl h
  --  · exact Or.inr h
  simpa