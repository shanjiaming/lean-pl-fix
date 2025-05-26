theorem h₅ (h_main :  ∀ (n : ℕ),    ∑ k ∈ Finset.Icc 1 n, 6 ^ k / ((3 ^ (k + 1) - 2 ^ (k + 1)) * (3 ^ k - 2 ^ k)) =      2 - 2 ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1))) (h₂ : ∀ (n : ℕ), 2 ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) = 2 ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1))) (h₄ : ∀ n ≥ 1, 3 ^ n ≥ 2 ^ n + 1) : ∀ n ≥ 1, 3 ^ n - 2 ^ n ≥ 1 := by
  --  intro n hn
  have h₆ : (3 : ℚ) ^ n ≥ 2 ^ n + 1 := h₄ n hn
  --  linarith
  hole