theorem h₁ (N : ℤ) (hN : N ≥ 2) (n : ℤ) (hn : n ≥ 2) : ↑n ^ 3 - 1 = (↑n - 1) * (↑n ^ 2 + ↑n + 1) := by -- ring
  linarith