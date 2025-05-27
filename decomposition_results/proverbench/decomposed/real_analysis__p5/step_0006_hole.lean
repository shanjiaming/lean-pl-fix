theorem h₂ (a b c d : ℝ) (h : a ^ 2 + b ^ 2 + c ^ 2 + d ^ 2 = a * (b + c + d)) (h₁ : a = 0) : b = 0 :=
  by
  have h₃ : a ^ 2 / 4 + (b - a / 2) ^ 2 + (c - a / 2) ^ 2 + (d - a / 2) ^ 2 = 0 := by sorry
  have h₄ : (b - a / 2) ^ 2 = 0 := by sorry
  have h₅ : b - a / 2 = 0 := by sorry
  have h₆ : b = a / 2 := by sorry
  --  --  rw [h₆, h₁] <;> norm_num
  hole