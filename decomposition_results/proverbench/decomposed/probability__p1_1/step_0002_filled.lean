theorem h₁ (h : 1 - rexp (-1) = 1 - rexp (-sorry)) : rexp (-sorry) = rexp (-1) :=
  by
  have h₂ : 1 - Real.exp (-1 : ℝ) = 1 - Real.exp (-(lambda : ℝ)) := by sorry
  have h₃ : Real.exp (-(lambda : ℝ)) = Real.exp (-1 : ℝ) := by sorry
  --  exact h₃
  hole