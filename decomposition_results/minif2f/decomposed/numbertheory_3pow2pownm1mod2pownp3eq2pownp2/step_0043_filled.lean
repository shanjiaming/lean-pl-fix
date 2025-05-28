theorem h₃ (n : ℕ) (h₀ : 0 < n) (k : ℕ) (hk h₂ : 3 ^ 2 ^ n = 1 + 2 ^ (n + 2) + k * 2 ^ (n + 3)) : 3 ^ 2 ^ n - 1 = 2 ^ (n + 2) + k * 2 ^ (n + 3) :=
  by
  have h₄ : 3 ^ 2 ^ n ≥ 1 := by sorry
  --  omega
  omega