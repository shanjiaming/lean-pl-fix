theorem h2₁ (x : ℝ) (h1 : (x + 1) ^ 2 * x = (x ^ 2 + 2 * x + 1) * x) : (x ^ 2 + 2 * x + 1) * x = x ^ 3 + 2 * x ^ 2 + x := by -- ring_nf <;> nlinarith
  linarith