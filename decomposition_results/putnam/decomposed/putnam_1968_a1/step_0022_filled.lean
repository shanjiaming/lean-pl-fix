theorem h₁ (h₀ : ∫ (x : ℝ) in 0 ..1, x ^ 4 * (1 - x) ^ 4 / (1 + x ^ 2) = 22 / 7 - Real.pi) : 22 / 7 - Real.pi = ∫ (x : ℝ) in 0 ..1, x ^ 4 * (1 - x) ^ 4 / (1 + x ^ 2) := by
  rw [← h₀] <;> simp [mul_comm] <;> ring_nf <;> norm_num <;> linarith [Real.pi_pos]
  hole