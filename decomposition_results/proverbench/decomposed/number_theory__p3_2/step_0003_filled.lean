theorem h₁ (p : ℕ) : (15 * (7 * p) + 8) % 7 = 1 :=
  by
  have h₂ : (15 * (7 * p) + 8 : ℕ) = 105 * p + 8 := by sorry
  --  rw [h₂]
  have h₃ : (105 * p + 8 : ℕ) % 7 = 1 := by sorry
  --  exact h₃
  omega