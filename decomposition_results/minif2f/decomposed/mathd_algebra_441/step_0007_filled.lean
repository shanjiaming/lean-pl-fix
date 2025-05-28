theorem h₂₁ (x : ℝ) (h₀ : x ≠ 0) (h₁ : 12 / (x * x) * (x ^ 4 / (14 * x)) * (35 / (3 * x)) = 12 * x ^ 4 * 35 / (x * x * (14 * x) * (3 * x))) : x * x * (14 * x) * (3 * x) = 42 * x ^ 4 := by
  --  ring_nf <;> simp_all [mul_assoc, mul_comm, mul_left_comm] <;> ring_nf <;> linarith
  linarith