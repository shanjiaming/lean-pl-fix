theorem h₃₅ (a b : ℤ) (h₀ : ∀ (x : ℝ), 10 * x ^ 2 - x - 24 = (↑a * x - 8) * (↑b * x + 3)) (h₁ : (a + 8) * (b - 3) = -13) (h₂ : (a - 8) * (b + 3) = -15) (h₃₂ : (a + 8) * (b - 3) = -13) (h₃₃ : (a - 8) * (b + 3) = -15) : a = 5 :=
  by
  have h₃₆ : a = 5 := by sorry
  --  exact h₃₆
  linarith