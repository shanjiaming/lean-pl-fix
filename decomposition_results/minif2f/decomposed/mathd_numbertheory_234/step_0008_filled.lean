theorem h₃₁ (a b : ℕ) (h₀ : 1 ≤ a ∧ a ≤ 9 ∧ b ≤ 9) (h₁ : (10 * a + b) ^ 3 = 912673) (h₂ : 10 * a + b ≤ 97) (h : ¬10 * a + b ≥ 97) : 10 * a + b ≤ 96 := by -- omega
  linarith