theorem h₂ (lambda : NNReal) (h : 1 - rexp (-1) = 1 - rexp (-↑lambda)) (h₁ : rexp (-↑lambda) = rexp (-1)) : -↑lambda = -1 :=
  by
  have h₃ : Real.exp (-(lambda : ℝ)) = Real.exp (-1) := h₁
  have h₄ : -(lambda : ℝ) = -1 := by sorry
  --  exact h₄
  hole