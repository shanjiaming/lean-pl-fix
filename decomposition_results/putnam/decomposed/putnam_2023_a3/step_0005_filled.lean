theorem h₁ (h₀ : π / 2 > 0) : Differentiable ℝ fun x => cos x :=
  by
  --  apply Differentiable.differentiableAt
  exact differentiable_cos
  hole