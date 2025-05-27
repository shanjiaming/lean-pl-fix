theorem h₁ (a b c d : ℝ) (h : a ^ 2 + b ^ 2 + c ^ 2 + d ^ 2 = a * (b + c + d)) : a = 0 :=
  by
  have h₂ : a ^ 2 / 4 + (b - a / 2) ^ 2 + (c - a / 2) ^ 2 + (d - a / 2) ^ 2 = 0 := by sorry
  have h₃ : a ^ 2 / 4 = 0 := by sorry
  have h₄ : a = 0 := by sorry
  exact h₄