theorem h_subset₁  : {f | Differentiable ℝ f ∧ ∀ (x : ℝ), ∀ n > 0, deriv f x = (f (x + (↑n : ℝ)) - f x) / (↑n : ℝ)} ⊆
    {f | ∃ c d, ∀ (x : ℝ), f x = c * x + d} :=
  by
  --  intro f hf
  have h₁ : Differentiable ℝ f := hf.1
  have h₂ : ∀ x : ℝ, ∀ n : ℤ, n > 0 → deriv f x = (f (x + n) - f x) / n := hf.2
  have h₃ : ∃ c d : ℝ, ∀ x : ℝ, f x = c * x + d := by sorry
  --  exact h₃
  hole