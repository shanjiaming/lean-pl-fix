theorem h₅ (n : ℕ) (h₀ : 10 ≤ n) (h₁ : ∃ x, x ^ 2 = n) (h₂ : ∃ t, t ^ 3 = n) (t : ℕ) (ht : t ^ 3 = n) (h : ¬t ≥ 3) : t ≤ 2 := by -- linarith
  linarith