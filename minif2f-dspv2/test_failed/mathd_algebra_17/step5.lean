theorem h₄ (a : ℝ) (h₀ : √(4 + √(16 + 16 * a)) + √(1 + √(1 + a)) = 6) (h : ¬16 + 16 * a ≥ 0) (h₂ : 16 + 16 * a < 0) (h₃ : √(16 + 16 * a) = 0) : √(4 + √(16 + 16 * a)) = 2 :=
  by
  rw [h₃]
  have h₅ : Real.sqrt (4 + (0 : ℝ)) = 2 := by sorry
  exact h₅