theorem f_differentiable (x : ℝ) : DifferentiableOn ℝ f (Set.Ioo 0 8) :=
  by
  have h_main : ∀ (x : ℝ), x ∈ Set.Ioo 0 8 → DifferentiableAt ℝ f x := by sorry
  have h_final : DifferentiableOn ℝ f (Set.Ioo 0 8) := by sorry
  --  exact h_final
  simpa