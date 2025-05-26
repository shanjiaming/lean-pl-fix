theorem h₂ (h₀ : π / 2 > 0) (h₁ : Differentiable ℝ fun x => cos x) : Differentiable ℝ fun x => -sin x :=
  by
  apply Differentiable.neg
  apply Differentiable.differentiableAt
  exact differentiable_sin