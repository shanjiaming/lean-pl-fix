theorem h₃ (p : ℕ) (h₂ : 15 * (7 * p) + 8 = 105 * p + 8) : (105 * p + 8) % 7 = 1 := by
  have h₄ : p % 7 = p % 7 := rfl
  have h₅ : (105 * p + 8 : ℕ) % 7 = 1 := by sorry
  --  exact h₅
  linarith