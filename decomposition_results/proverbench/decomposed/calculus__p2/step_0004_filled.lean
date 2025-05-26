theorem h₄ (f : ℝ → ℝ := fun x => (8 * x ^ 2 + 6 * x + 5) / (x ^ 2 + 2 * x + 2)) (x : ℝ) (hx h₃ : x ^ 2 + 2 * x + 2 = 0) : False := by -- nlinarith [sq_nonneg (x + 1)]
  nlinarith