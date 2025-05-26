theorem h₂ (x y z : ℕ) (h : x * y = z ^ 2 + 1) (hx : x = 1) : y = z ^ 2 + 1 := by
  have h₃ : (x : ℕ) * y = z ^ 2 + 1 := by sorry
  have h₄ : y = z ^ 2 + 1 := by sorry
  exact h₄