theorem h₄ (a b : NNReal) (h₀ : 0 < a ∧ 0 < b) (h₁ : a ^ 2 = 6 * b) (h₂ : a ^ 2 = 54 / b) (h₃ : ↑b = 3) : ↑a ^ 2 = 18 :=
  by
  have h₄₁ : (a : ℝ) ^ 2 = 6 * (b : ℝ) := by sorry
  --  rw [h₄₁]
  rw [h₃] <;> norm_num
  hole