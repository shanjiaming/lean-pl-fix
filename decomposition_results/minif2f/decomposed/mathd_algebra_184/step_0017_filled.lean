theorem h₅ (a b : NNReal) (h₀ : 0 < a ∧ 0 < b) (h₁ : a ^ 2 = 6 * b) (h₂ : a ^ 2 = 54 / b) (h₃ : ↑b = 3) (h₄ : ↑a ^ 2 = 18) : ↑a = 3 * √2 :=
  by
  have h₅₁ : 0 < (a : ℝ) := by sorry
  have h₅₂ : 0 < Real.sqrt 2 := by sorry
  have h₅₃ : 0 < 3 * Real.sqrt 2 := by sorry
  have h₅₄ : (a : ℝ) ^ 2 = 18 := h₄
  have h₅₅ : (a : ℝ) > 0 := by sorry
  have h₅₆ : (a : ℝ) = 3 * Real.sqrt 2 := by sorry
  --  exact h₅₆
  hole