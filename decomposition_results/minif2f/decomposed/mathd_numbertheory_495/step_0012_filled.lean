theorem h₆ (a b : ℕ) (h₀ : 0 < a ∧ 0 < b) (h₁ : a % 10 = 2) (h₂ : b % 10 = 4) (h₃ : a.gcd b = 6) (h₄ : 12 ≤ a) (h₅ : 24 ≤ b) : a ≠ 0 := by -- linarith
  linarith