theorem h₄ (a b c d : ℝ) (h : a ^ 2 + b ^ 2 + c ^ 2 + d ^ 2 = a * (b + c + d)) (h₁ : a = 0) (h₂ : b = 0) (h₃ : c = 0) : d = 0 :=
  by
  have h₅ : a ^ 2 / 4 + (b - a / 2) ^ 2 + (c - a / 2) ^ 2 + (d - a / 2) ^ 2 = 0 := by sorry
  have h₆ : (d - a / 2) ^ 2 = 0 := by sorry
  have h₇ : d - a / 2 = 0 := by sorry
  have h₈ : d = a / 2 := by sorry
  rw [h₈, h₁] <;> norm_num