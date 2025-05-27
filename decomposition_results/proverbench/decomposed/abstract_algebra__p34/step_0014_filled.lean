theorem h12 (n : ℕ) (x : ℝ) (hx h1 : x = 0) (k : ℕ) (hk : k ∈ range (2 * n + 1)) (h5 : k < 2 * n + 1) (hk0 : ¬k = 0) (h6 : k ≥ 1) (h8 : k ≠ 0) (h10 : 1 ≤ k) : k ≥ 1 := by -- omega
  linarith