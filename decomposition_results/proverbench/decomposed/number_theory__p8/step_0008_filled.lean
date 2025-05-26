theorem h₅ (x y z : ℕ) (h : x * y = z ^ 2 + 1) (hx : ¬x = 1) (hy : y = 1) (hx' : ¬x = z ^ 2 + 1) (h₂ : x * y = z ^ 2 + 1) (h₄ : y = 1) : x * y = z ^ 2 + 1 := by -- simpa using h
  linarith