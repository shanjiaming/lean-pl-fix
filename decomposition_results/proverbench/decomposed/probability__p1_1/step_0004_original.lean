theorem h₃ (lambda : NNReal) (h h₂ : 1 - rexp (-1) = 1 - rexp (-↑lambda)) : rexp (-↑lambda) = rexp (-1) :=
  by
  have h₄ : Real.exp (-(lambda : ℝ)) = Real.exp (-1 : ℝ) := by sorry
  exact h₄