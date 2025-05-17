theorem h₂ (a : ℝ) (h₀ : √(4 + √(16 + 16 * a)) + √(1 + √(1 + a)) = 6) (h₁ : 16 + 16 * a ≥ 0) : 1 + a ≥ 0 := by
  by_contra h
  have h₃ : 1 + a < 0 := by sorry
  have h₄ : Real.sqrt (1 + a) = 0 := by sorry
  have h₅ : Real.sqrt (1 + Real.sqrt (1 + a)) = 1 := by sorry
  have h₆ : Real.sqrt (4 + Real.sqrt (16 + 16 * a)) = 5 := by sorry
  have h₇ : 4 + Real.sqrt (16 + 16 * a) = 25 := by sorry
  have h₈ : Real.sqrt (16 + 16 * a) = 21 := by sorry
  have h₉ : 16 + 16 * a = 441 := by sorry
  have h₁₀ : a < -1 := by sorry
  have h₁₁ : a ≥ -1 := by sorry
  linarith