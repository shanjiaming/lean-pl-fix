theorem h₉ (n : ℕ) (h₀ : 10 ≤ n) (h₁ : ∃ x, x ^ 2 = n) (h₂ : ∃ t, t ^ 3 = n) (t : ℕ) (ht : t ^ 3 = n) (h : ¬t ≥ 3) (h₅ : t ≤ 2) (h₆ : t ^ 3 ≤ 8) : n ≤ 8 := by -- linarith
  hole