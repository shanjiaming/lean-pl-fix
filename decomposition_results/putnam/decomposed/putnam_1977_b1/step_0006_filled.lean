theorem h₃ (N : ℤ) (hN : N ≥ 2) (n : ℤ) (hn : n ≥ 2) (h₁ : ↑n ^ 3 - 1 = (↑n - 1) * (↑n ^ 2 + ↑n + 1)) (h₂ : ↑n ^ 3 + 1 = (↑n + 1) * (↑n ^ 2 - ↑n + 1)) : ↑n ≠ -1 := by
  --  intro h
  --  --  norm_cast at h <;> nlinarith
  linarith