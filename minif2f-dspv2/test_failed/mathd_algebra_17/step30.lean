theorem h₆ (a : ℝ) (h₀ : √(4 + √(16 + 16 * a)) + √(1 + √(1 + a)) = 6) (h₁ : 16 + 16 * a ≥ 0) (h₃ : 1 + a < 0) (h₄ : √(1 + a) = 0) (h₅ : √(1 + √(1 + a)) = 1) : √(4 + √(16 + 16 * a)) = 5 :=
  by
  have h₆₁ : Real.sqrt (4 + Real.sqrt (16 + 16 * a)) + Real.sqrt (1 + Real.sqrt (1 + a)) = 6 := h₀
  rw [h₅] at h₆₁
  have h₆₂ : Real.sqrt (4 + Real.sqrt (16 + 16 * a)) + 1 = 6 := by sorry
  have h₆₃ : Real.sqrt (4 + Real.sqrt (16 + 16 * a)) = 5 := by sorry
  exact h₆₃