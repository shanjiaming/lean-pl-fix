theorem h₁₁ (n✝ n k : ℕ) (hk : k ≥ 1) (h₃ : 3 ^ k - 2 ^ k > 0) (h₄ : 3 ^ (k + 1) - 2 ^ (k + 1) > 0) (h₆ : 6 ^ k = 2 ^ k * 3 ^ k) (h₈ : 3 ^ (k + 1) - 2 ^ (k + 1) = 3 * 3 ^ k - 2 * 2 ^ k) (h₉ : 3 ^ k - 2 ^ k ≠ 0) : 3 * 3 ^ k - 2 * 2 ^ k > 0 :=
  by
  have h₁₂ : (3 : ℚ) ^ k > (2 : ℚ) ^ k := by sorry
  have h₁₃ : (3 * (3 : ℚ) ^ k - 2 * (2 : ℚ) ^ k : ℚ) > 0 := by sorry
  linarith
  hole