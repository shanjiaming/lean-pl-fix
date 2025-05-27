theorem h₂ (x : ℝ) (h : f_deriv x = 0) (h₁ : 3 * x ^ 2 - 18 * x + 24 = 0) : x = 2 ∨ x = 4 := by
  have h₃ : x ^ 2 - 6 * x + 8 = 0 := by sorry
  have h₄ : (x - 2) * (x - 4) = 0 := by sorry
  have h₅ : x - 2 = 0 ∨ x - 4 = 0 := by sorry
  cases h₅ with
  | inl h₅ =>
    have h₆ : x = 2 := by linarith
    exact Or.inl h₆
  | inr h₅ =>
    have h₆ : x = 4 := by linarith
    exact Or.inr h₆