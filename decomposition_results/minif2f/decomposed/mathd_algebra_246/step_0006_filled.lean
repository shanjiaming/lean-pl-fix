theorem h₄₃ (a b : ℝ) (f : ℝ → ℝ) (h₀ : ∀ (x : ℝ), f x = a * x ^ 4 - b * x ^ 2 + x + 5) (h₂ : f (-3) = 2) (h₃ h₄₁ : 81 * a - 9 * b = 0) (h₄₂ : 9 * a - b = 0) : b = 9 * a := by -- linarith
  linarith