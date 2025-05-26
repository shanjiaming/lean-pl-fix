theorem h₅ (n✝ n k : ℕ) (hk : k ≥ 1) (h₃ : 3 ^ k - 2 ^ k > 0) : 3 ^ (k + 1) > 2 ^ (k + 1) := by exact pow_lt_pow_of_lt_left (by norm_num) (by norm_num) (by omega)
  hole