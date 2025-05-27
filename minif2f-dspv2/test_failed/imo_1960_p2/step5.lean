theorem h₅ (x : ℝ) (h₀ : 0 ≤ 1 + 2 * x) (h₁ : (1 - √(1 + 2 * x)) ^ 2 ≠ 0) (h₂ : 4 * x ^ 2 / (1 - √(1 + 2 * x)) ^ 2 < 2 * x + 9) (h₃ : -(1 / 2) ≤ x) (hx : x > 0) : √(1 + 2 * x) > 1 := by
  apply Real.lt_sqrt_of_sq_lt
  nlinarith