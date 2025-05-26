theorem h₆ (n✝ n k : ℕ) (hk : k ≥ 1) (h₃ : 3 ^ k - 2 ^ k > 0) (h₄ : 3 ^ (k + 1) - 2 ^ (k + 1) > 0) : 6 ^ k = 2 ^ k * 3 ^ k :=
  by
  rw [show (6 : ℚ) = (2 : ℚ) * 3 by norm_num]
  rw [mul_pow] <;> ring_nf
  hole