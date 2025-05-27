theorem h₆₃ (a : ℝ) (h₀ : √(4 + √(16 + 16 * a)) + √(1 + √(1 + a)) = 6) (h₁ : 16 + 16 * a ≥ 0) (h₂ : 1 + a ≥ 0) (h₃ : √(16 + 16 * a) = 4 * √(1 + a)) (h₄ : √(4 + √(16 + 16 * a)) = 2 * √(1 + √(1 + a))) (h₅ h₆₁ : √(1 + √(1 + a)) = 2) (h₆₂ : √(1 + √(1 + a)) ^ 2 = 2 ^ 2) : 1 + √(1 + a) ≥ 0 := by
  by_contra h₆₃
  have h₆₄ : 1 + Real.sqrt (1 + a) < 0 := by sorry
  have h₆₅ : Real.sqrt (1 + Real.sqrt (1 + a)) = 0 := by sorry
  rw [h₆₅] at h₆₁
  norm_num at h₆₁ <;> linarith