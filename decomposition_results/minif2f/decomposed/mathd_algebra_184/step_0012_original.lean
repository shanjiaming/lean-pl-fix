theorem h₄ (a b : NNReal) (h₀ : 0 < a ∧ 0 < b) (h₁ : a ^ 2 = 6 * b) (h₂ : a ^ 2 = 54 / b) (h₃₁ : ↑a ^ 2 = 6 * ↑b) (h₃₂ : ↑a ^ 2 = 54 / ↑b) (h₃₃ : 6 * ↑b = 54 / ↑b) (h₃₄ : ↑b > 0) (h₃₅ : ↑b ^ 2 = 9) : ↑b = 3 := by
  have h₄₁ : (b : ℝ) ^ 2 = 9 := by sorry
  have h₄₂ : (b : ℝ) > 0 := by sorry
  nlinarith