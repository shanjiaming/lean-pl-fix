theorem h₄ (a b : ℝ) (h₀ : a = -1) (h₁ : b = 5) (h₂ : -a = 1) (h₃ : b ^ 2 = 25) : 3 * (a * b) = -15 := by -- -- rw [h₀, h₁] <;> norm_num
  nlinarith