theorem h₃ (m a : ℕ) (h₀ : 0 < m ∧ 0 < a) (h₁ : ↑m / ↑a = 3 / 4) (h₂ : 4 * ↑m = 3 * ↑a) : 4 * m = 3 * a :=
  by
  have h₃₁ : (4 : ℕ) * m = (3 : ℕ) * a := by sorry
  --  exact h₃₁
  linarith