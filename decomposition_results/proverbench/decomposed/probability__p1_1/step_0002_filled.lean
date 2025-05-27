theorem h₁ (lambda : NNReal) (h : 1 - rexp (-1) = 1 - rexp (-↑lambda)) : rexp (-↑lambda) = rexp (-1) :=
  by
  have h₂ : 1 - Real.exp (-1 : ℝ) = 1 - Real.exp (-(lambda : ℝ)) := by sorry
  have h₃ : Real.exp (-(lambda : ℝ)) = Real.exp (-1 : ℝ) := by sorry
  --  exact h₃
  linarith