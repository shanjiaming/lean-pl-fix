theorem h₅ (a b : ℕ) (h₀ : 0 < a ∧ 0 < b) (h₁ : a % 10 = 2) (h₂ : b % 10 = 4) (h₃ : a.gcd b = 6) (h : ¬12 ≤ a) : a ≤ 11 := by -- linarith
  linarith