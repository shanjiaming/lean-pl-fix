theorem h₅ (a b : ℝ) (h₀ : a ^ 2 + b ^ 2 = 1) (h₁ : a ^ 2 ≤ 1) (h₂ : b ^ 2 ≤ 1) (h₃ : 1 - a ≥ 0) (h₄ : 1 + b ≥ 0) : (1 - a) * (1 + b) ≥ 0 := by -- nlinarith [h₃, h₄]
  nlinarith