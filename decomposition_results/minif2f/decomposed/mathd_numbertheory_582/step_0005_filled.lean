theorem h₂₃ (n : ℕ) (h₀ : 0 < n) (h₁ : 3 ∣ n) (h₂₂ : n + 4 + (n + 6) + (n + 8) = n + 4 + (n + 6) + (n + 8)) : n + 4 + (n + 6) = 2 * n + 10 := by -- ring
  linarith