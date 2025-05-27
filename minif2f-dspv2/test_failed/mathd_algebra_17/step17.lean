theorem h₈ (a : ℝ) (h₀ : √(4 + √(16 + 16 * a)) + √(1 + √(1 + a)) = 6) (h : ¬16 + 16 * a ≥ 0) (h₂ : 16 + 16 * a < 0) (h₃ : √(16 + 16 * a) = 0) (h₄ : √(4 + √(16 + 16 * a)) = 2) (h₅ : √(1 + √(1 + a)) = 4) (h₆ : 1 + √(1 + a) = 16) (h₇ : √(1 + a) = 15) : 1 + a ≥ 0 := by
  by_contra h₈
  have h₉ : 1 + a < 0 := by sorry
  have h₁₀ : Real.sqrt (1 + a) = 0 := by sorry
  rw [h₁₀] at h₇
  norm_num at h₇