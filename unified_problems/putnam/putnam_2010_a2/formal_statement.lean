theorem putnam_2010_a2
: {f : ℝ → ℝ | Differentiable ℝ f ∧
∀ x : ℝ, ∀ n : ℤ, n > 0 → deriv f x = (f (x + n) - f x)/n} = (({f : ℝ → ℝ | ∃ c d : ℝ, ∀ x : ℝ, f x = c*x + d}) : Set (ℝ → ℝ) ) := by