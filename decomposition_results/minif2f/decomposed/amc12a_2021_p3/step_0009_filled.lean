theorem h₄₂ (x y : ℕ) (h₀ : x + y = 17402) (h₁ : 10 ∣ x) (h₂ : x / 10 = y) (h₃ : x = 10 * y) (h₄₁ : 11 * y = 17402) : y = 1582 := by -- omega
  linarith