theorem mathd_algebra_17 (a : ℝ) (h₀ : √(4 + √(16 + 16 * a)) + √(1 + √(1 + a)) = 6) : a = 8 :=
  by
  have h₁ : 16 + 16 * a ≥ 0 := by sorry
  have h₂ : 1 + a ≥ 0 := by sorry
  have h₃ : Real.sqrt (16 + 16 * a) = 4 * Real.sqrt (1 + a) := by sorry
  have h₄ : Real.sqrt (4 + Real.sqrt (16 + 16 * a)) = 2 * Real.sqrt (1 + Real.sqrt (1 + a)) := by sorry
  have h₅ : Real.sqrt (1 + Real.sqrt (1 + a)) = 2 := by sorry
  have h₆ : 1 + Real.sqrt (1 + a) = 4 := by sorry
  have h₇ : Real.sqrt (1 + a) = 3 := by sorry
  have h₈ : 1 + a = 9 := by sorry
  have h₉ : a = 8 := by sorry
  exact h₉