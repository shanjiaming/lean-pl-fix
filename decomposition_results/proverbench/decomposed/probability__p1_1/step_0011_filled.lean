theorem h₄ (lambda : NNReal) (h : 1 - rexp (-1) = 1 - rexp (-↑lambda)) (h₁ : rexp (-↑lambda) = rexp (-1)) (h₂ : -↑lambda = -1) (h₃ : ↑lambda = 1) : lambda = 1 := by
  have h₅ : (lambda : ℝ) = 1 := h₃
  have h₆ : lambda = 1 := by sorry
  --  exact h₆
  hole