theorem P_X_leq_1 (lambda : NNReal) : poisson_pmf lambda 0 + poisson_pmf lambda 1 = 2 * rexp (-↑lambda) :=
  by
  have h₀ : poisson_pmf lambda 0 = Real.exp (-(lambda : ℝ)) := by sorry
  have h₁ : poisson_pmf lambda 1 = Real.exp (-(lambda : ℝ)) := by sorry
  have h₂ : poisson_pmf lambda 0 + poisson_pmf lambda 1 = 2 * Real.exp (-(lambda : ℝ)) := by sorry
  --  apply h₂
  hole