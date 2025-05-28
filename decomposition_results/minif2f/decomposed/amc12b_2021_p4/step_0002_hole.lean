theorem h₂ (m a : ℕ) (h₀ : 0 < m ∧ 0 < a) (h₁ : ↑m / ↑a = 3 / 4) : 4 * ↑m = 3 * ↑a :=
  by
  have h₂₁ : (m : ℝ) / (a : ℝ) = (3 : ℝ) / 4 := h₁
  have h₂₂ : (a : ℝ) ≠ 0 := by sorry
  have h₂₃ : (4 : ℝ) * (m : ℝ) = (3 : ℝ) * (a : ℝ) := by sorry
  --  exact h₂₃
  hole