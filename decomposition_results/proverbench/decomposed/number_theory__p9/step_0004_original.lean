theorem h₂ (m : ℤ) (h : (↑m : ℝ) = 2 + 2 * √(28 * sorry ^ 2 + 1)) (k : ℤ) (hk : √(28 * sorry ^ 2 + 1) = (↑k : ℝ)) (h₁ : (↑k : ℝ) = √(28 * sorry ^ 2 + 1)) : (↑k : ℝ) ^ 2 = 28 * sorry ^ 2 + 1 := by
  rw [h₁]
  rw [Real.sq_sqrt (by positivity)] <;> ring_nf <;> nlinarith