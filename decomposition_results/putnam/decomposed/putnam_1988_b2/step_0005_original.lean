theorem h₆ (x y : ℝ) (h : y ≥ 0 ∧ y * (y + 1) ≤ (x + 1) ^ 2) (h₁ : y ≥ 0) (h₂ : y * (y + 1) ≤ (x + 1) ^ 2) (h₃ : ¬y ≤ 1) (h₄ : y > 1) (h₅ : (x + 1) ^ 2 ≥ y * (y + 1)) : x + 1 ≥ √(y * (y + 1)) ∨ x + 1 ≤ -√(y * (y + 1)) :=
  by
  have h₇ : (x + 1) ^ 2 ≥ y * (y + 1) := by sorry
  have h₈ : x + 1 ≥ Real.sqrt (y * (y + 1)) ∨ x + 1 ≤ -Real.sqrt (y * (y + 1)) := by sorry
  exact h₈