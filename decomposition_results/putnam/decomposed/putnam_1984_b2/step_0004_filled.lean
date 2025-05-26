theorem h₃ (f : ℝ → ℝ → ℝ) (hf : ∀ (u v : ℝ), f u v = (u - v) ^ 2 + (√(2 - u ^ 2) - 9 / v) ^ 2) (h₁ : 0 < √2) (h₂ : 1 < √2) : 0 < 3 := by -- norm_num
  norm_num