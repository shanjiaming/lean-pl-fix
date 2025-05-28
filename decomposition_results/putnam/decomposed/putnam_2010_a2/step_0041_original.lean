theorem h_main (h_subset₁ :  {f | Differentiable ℝ f ∧ ∀ (x : ℝ), ∀ n > 0, deriv f x = (f (x + ↑n) - f x) / ↑n} ⊆    {f | ∃ c d, ∀ (x : ℝ), f x = c * x + d}) (h_subset₂ :  {f | ∃ c d, ∀ (x : ℝ), f x = c * x + d} ⊆    {f | Differentiable ℝ f ∧ ∀ (x : ℝ), ∀ n > 0, deriv f x = (f (x + ↑n) - f x) / ↑n}) : {f | Differentiable ℝ f ∧ ∀ (x : ℝ), ∀ n > 0, deriv f x = (f (x + ↑n) - f x) / ↑n} =
    {f | ∃ c d, ∀ (x : ℝ), f x = c * x + d} :=
  by
  apply Set.Subset.antisymm
  · exact h_subset₁
  · exact h_subset₂