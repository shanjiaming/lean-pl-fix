theorem h₆ (n : ℕ) (h₀ : 2 ≤ n) (h₁ : ∃ x, x ^ 3 = n) (t : ℕ) (ht : t ^ 4 = n) (h₃ : t ≥ 2) (h : ¬t ≥ 8) (h₅ : t ≤ 7) : t = 2 ∨ t = 3 ∨ t = 4 ∨ t = 5 ∨ t = 6 ∨ t = 7 := by -- omega
  omega