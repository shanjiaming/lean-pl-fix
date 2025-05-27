theorem h₂ (x✝ x : ℝ) (h : f_deriv x = 0) (h₁ : f_deriv x = 0 ↔ x = 2 ∨ x = 4) : x = 2 ∨ x = 4 := by apply (h₁.mp h)
  hole