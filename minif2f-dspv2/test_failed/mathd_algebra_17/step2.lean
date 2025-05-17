theorem h₁ (a : ℝ) (h₀ : √(4 + √(16 + 16 * a)) + √(1 + √(1 + a)) = 6) : 16 + 16 * a ≥ 0 := by
  by_contra h
  have h₂ : 16 + 16 * a < 0 := by sorry
  have h₃ : Real.sqrt (16 + 16 * a) = 0 := by sorry
  have h₄ : Real.sqrt (4 + Real.sqrt (16 + 16 * a)) = 2 := by sorry
  have h₅ : Real.sqrt (1 + Real.sqrt (1 + a)) = 4 := by sorry
  have h₆ : 1 + Real.sqrt (1 + a) = 16 := by sorry
  have h₇ : Real.sqrt (1 + a) = 15 := by sorry
  have h₈ : 1 + a ≥ 0 := by sorry
  have h₉ : Real.sqrt (1 + a) = 15 := h₇
  have h₁₀ : 1 + a = 225 := by sorry
  have h₁₁ : a = 224 := by sorry
  have h₁₂ : a < -1 := by sorry
  linarith