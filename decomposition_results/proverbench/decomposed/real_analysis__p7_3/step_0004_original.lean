theorem h_final (x : ℝ) (h_main : ∀ x ∈ Set.Ioo 0 8, DifferentiableAt ℝ f x) : DifferentiableOn ℝ f (Set.Ioo 0 8) := by
  intro x hx
  exact h_main x hx