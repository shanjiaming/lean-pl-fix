theorem h₂₂ (m n p q : ℝ) (h₀ : p = 2 ^ m) (h₁ : q = 3 ^ n) (h₂₁ : 2 ^ m > 0) : (2 ^ m) ^ (2 * n) = 2 ^ (m * (2 * n)) := by
  rw [← Real.rpow_mul] <;> ring_nf <;> norm_num <;> linarith