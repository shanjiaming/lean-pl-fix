theorem h₂₄ (n✝ n : ℕ) (h₁ : 3 ^ n + 2 ^ n = 3 ^ n * (1 + (2 / 3) ^ n)) (h₂₁ : 3 ^ (n + 1) > 0) (h₂₂ : 2 / 3 > 0) : (2 / 3) ^ (n + 1) < 1 := by
  apply
    pow_lt_one (by norm_num) (by norm_num)
      (by
        have h₂₅ : n + 1 > 0 := by linarith [Nat.zero_le n]
        linarith)