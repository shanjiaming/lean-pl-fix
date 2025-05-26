theorem h₆ (x y z : ℕ) (h : x * y = z ^ 2 + 1) (hx : ¬x = 1) (hy : ¬y = 1) (h₂ : x * y = z ^ 2 + 1) (h₃ h₄ : x = z ^ 2 + 1) (h₅ : x * y = z ^ 2 + 1) : x = z ^ 2 + 1 := by -- exact h₃
  linarith