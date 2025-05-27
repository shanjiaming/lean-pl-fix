theorem h₃ (h₁ : f.IsRoot 1) (y : Z2) (h_y : f.IsRoot y) : y = 0 ∨ y = 1 := by
  revert y
  decide