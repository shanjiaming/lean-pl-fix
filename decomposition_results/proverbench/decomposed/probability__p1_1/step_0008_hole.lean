theorem h₃ (lambda : NNReal) (h : 1 - rexp (-1) = 1 - rexp (-↑lambda)) (h₁ : rexp (-↑lambda) = rexp (-1)) (h₂ : -↑lambda = -1) : ↑lambda = 1 := by
  have h₄ : -(lambda : ℝ) = -1 := h₂
  have h₅ : (lambda : ℝ) = 1 := by sorry
  --  exact h₅
  hole