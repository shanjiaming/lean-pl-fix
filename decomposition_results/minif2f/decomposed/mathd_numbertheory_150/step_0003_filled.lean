theorem h₂ (n : ℕ) (h₀ : ¬Nat.Prime (7 + 30 * n)) (h : ¬n ≥ 6) : n ≤ 5 := by -- linarith
  linarith