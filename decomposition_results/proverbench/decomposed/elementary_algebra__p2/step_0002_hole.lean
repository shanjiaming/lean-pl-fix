theorem h₁ (a b c d : ℝ) (h : a ^ 2 + b ^ 2 + c ^ 2 + d ^ 2 = a * (b + c + d)) : (a - (b + c + d) / 2) ^ 2 + (3 * (b ^ 2 + c ^ 2 + d ^ 2) - 2 * (b * c + b * d + c * d)) / 4 = 0 :=
  by
  have h₁₁ : a ^ 2 + b ^ 2 + c ^ 2 + d ^ 2 = a * (b + c + d) := h
  have h₁₂ : (a - (b + c + d) / 2) ^ 2 + (3 * (b ^ 2 + c ^ 2 + d ^ 2) - 2 * (b * c + b * d + c * d)) / 4 = 0 := by sorry
  --  exact h₁₂
  hole