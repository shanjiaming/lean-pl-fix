theorem h₄ (n : ℕ) (h₀ : 2 ≤ n) (h₁ : ∃ x, x ^ 3 = n) (t : ℕ) (ht : t ^ 4 = n) (h : ¬t ≥ 2) : t ≤ 1 := by -- linarith
  linarith