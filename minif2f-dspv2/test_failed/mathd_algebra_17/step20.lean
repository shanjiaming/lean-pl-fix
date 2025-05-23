theorem h₁₀ (a : ℝ) (h₀ : √(4 + √(16 + 16 * a)) + √(1 + √(1 + a)) = 6) (h : ¬16 + 16 * a ≥ 0) (h₂ : 16 + 16 * a < 0) (h₃ : √(16 + 16 * a) = 0) (h₄ : √(4 + √(16 + 16 * a)) = 2) (h₅ : √(1 + √(1 + a)) = 4) (h₆ : 1 + √(1 + a) = 16) (h₇ : √(1 + a) = 15) (h₈ : 1 + a ≥ 0) (h₉ : √(1 + a) = 15) : 1 + a = 225 := by
  have h₁₀₁ : Real.sqrt (1 + a) = 15 := h₉
  have h₁₀₂ : Real.sqrt (1 + a) ^ 2 = 15 ^ 2 := by sorry
  have h₁₀₃ : 1 + a = 225 := by sorry
  exact h₁₀₃