theorem h₂ (n : ℕ) (m : ℤ) (h : ↑m = 2 + 2 * √(28 * ↑n ^ 2 + 1)) (k : ℤ) (hk : √(28 * ↑n ^ 2 + 1) = ↑k) (h₁ : ↑k = √(28 * ↑n ^ 2 + 1)) : ↑k ^ 2 = 28 * ↑n ^ 2 + 1 := by
  --  rw [h₁]
  rw [Real.sq_sqrt (by positivity)] <;> ring_nf <;> nlinarith
  hole