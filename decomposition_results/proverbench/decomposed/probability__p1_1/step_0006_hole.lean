theorem h₂ (h : 1 - rexp (-1) = 1 - rexp (-sorry)) (h₁ : rexp (-sorry) = rexp (-1)) : -sorry = -1 :=
  by
  have h₃ : Real.exp (-(lambda : ℝ)) = Real.exp (-1) := h₁
  have h₄ : -(lambda : ℝ) = -1 := by sorry
  --  exact h₄
  hole