theorem h₇₃ (a : ℝ) (h₀ : √(4 + √(16 + 16 * a)) + √(1 + √(1 + a)) = 6) (h₁ : 16 + 16 * a ≥ 0) (h₃ : 1 + a < 0) (h₄ : √(1 + a) = 0) (h₅ : √(1 + √(1 + a)) = 1) (h₆ h₇₁ : √(4 + √(16 + 16 * a)) = 5) (h₇₂ : √(4 + √(16 + 16 * a)) ^ 2 = 5 ^ 2) : 4 + √(16 + 16 * a) ≥ 0 := by
  by_contra h₇₃
  have h₇₄ : 4 + Real.sqrt (16 + 16 * a) < 0 := by sorry
  have h₇₅ : Real.sqrt (4 + Real.sqrt (16 + 16 * a)) = 0 := by sorry
  rw [h₇₅] at h₇₁
  norm_num at h₇₅ h₇₁ ⊢ <;> linarith