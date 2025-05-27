theorem h₃ (x : ℝ) (h : f_deriv x = 0) (h₁ : 6 * x ^ 2 - 6 * x - 36 = 0) (h₂ : x ^ 2 - x - 6 = 0) : x = -2 ∨ x = 3 := by
  have h₄ : (x + 2) * (x - 3) = 0 := by sorry
  have h₅ : x + 2 = 0 ∨ x - 3 = 0 := by sorry
  --  cases h₅ with
  --  | inl h₅ =>
  --    have h₆ : x = -2 := by linarith
  --    exact Or.inl h₆
  --  | inr h₅ =>
  --    have h₆ : x = 3 := by linarith
  --    exact Or.inr h₆
  hole