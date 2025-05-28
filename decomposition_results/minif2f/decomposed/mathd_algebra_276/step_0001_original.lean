theorem mathd_algebra_276 (a b : ℤ) (h₀ : ∀ (x : ℝ), 10 * x ^ 2 - x - 24 = (↑a * x - 8) * (↑b * x + 3)) : a * b + b = 12 :=
  by
  have h₁ : (a + 8 : ℤ) * (b - 3) = -13 := by sorry
  have h₂ : (a - 8 : ℤ) * (b + 3) = -15 := by sorry
  have h₃ : a = 5 := by sorry
  have h₄ : b = 2 := by sorry
  have h₅ : a * b + b = 12 := by sorry
  exact h₅