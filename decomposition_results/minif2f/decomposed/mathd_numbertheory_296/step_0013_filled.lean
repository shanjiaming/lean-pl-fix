theorem h₁₀ (n : ℕ) (h₀ : 2 ≤ n) (ht : 2 ^ 4 = n) (h₃ : 2 ≥ 2) (h : ¬2 ≥ 8) (h₅ : 2 ≤ 7) (h₇ : n = 16) (x : ℕ) (hx : x ^ 3 = n) (h₈ : x ^ 3 = 16) (h₉ : ¬x ≤ 2) : x ≥ 3 := by -- omega
  linarith