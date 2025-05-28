theorem h₃ (a b : NNReal) (h₀ : 0 < a ∧ 0 < b) (h₁ : a ^ 2 = 6 * b) (h₂ : a ^ 2 = 54 / b) : ↑b = 3 :=
  by
  have h₃₁ : (a : ℝ) ^ 2 = 6 * (b : ℝ) := by sorry
  have h₃₂ : (a : ℝ) ^ 2 = 54 / (b : ℝ) := by sorry
  have h₃₃ : (6 : ℝ) * (b : ℝ) = 54 / (b : ℝ) := by sorry
  have h₃₄ : (b : ℝ) > 0 := by sorry
  have h₃₅ : (b : ℝ) ^ 2 = 9 := by sorry
  have h₃₆ : (b : ℝ) = 3 := by sorry
  exact_mod_cast h₃₆