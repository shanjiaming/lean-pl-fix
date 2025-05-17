theorem h₅ (a : ℝ) (h₀ : √(4 + √(16 + 16 * a)) + √(1 + √(1 + a)) = 6) (h₁ : 16 + 16 * a ≥ 0) (h₃ : 1 + a < 0) (h₄ : √(1 + a) = 0) : √(1 + √(1 + a)) = 1 := by
  rw [h₄]
  have h₅₁ : Real.sqrt (1 + (0 : ℝ)) = 1 := by sorry
  exact h₅₁