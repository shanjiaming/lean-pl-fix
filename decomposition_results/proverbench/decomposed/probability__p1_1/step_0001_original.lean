theorem lambda_eq_1 (lambda : NNReal) (h : 1 - rexp (-1) = 1 - rexp (-↑lambda)) : lambda = 1 :=
  by
  have h₁ : Real.exp (-(lambda : ℝ)) = Real.exp (-1) := by sorry
  have h₂ : -(lambda : ℝ) = -1 := by sorry
  have h₃ : (lambda : ℝ) = 1 := by sorry
  have h₄ : lambda = 1 := by sorry
  exact h₄