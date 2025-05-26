theorem h₁₃ (n✝ n k : ℕ) (hk : k ≥ 1) (h₃ : 3 ^ k - 2 ^ k > 0) (h₄ : 3 ^ (k + 1) - 2 ^ (k + 1) > 0) (h₆ : 6 ^ k = 2 ^ k * 3 ^ k) (h₈ : 3 ^ (k + 1) - 2 ^ (k + 1) = 3 * 3 ^ k - 2 * 2 ^ k) (h₉ : 3 ^ k - 2 ^ k ≠ 0) (h₁₂ : 3 ^ k > 2 ^ k) : 3 * 3 ^ k - 2 * 2 ^ k > 0 := by
  nlinarith [pow_pos (by norm_num : (0 : ℚ) < 2) k, pow_pos (by norm_num : (0 : ℚ) < 3) k]
  hole