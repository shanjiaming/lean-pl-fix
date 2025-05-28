theorem h₈ (x y : ℝ) (h : y ≥ 0 ∧ y * (y + 1) ≤ (x + 1) ^ 2) (h₁ : y ≥ 0) (h₂ : y * (y + 1) ≤ (x + 1) ^ 2) (h₃ : ¬y ≤ 1) (h₄ : y > 1) (h₅ h₇ : (x + 1) ^ 2 ≥ y * (y + 1)) : x + 1 ≥ √(y * (y + 1)) ∨ x + 1 ≤ -√(y * (y + 1)) :=
  by
  have h₉ : Real.sqrt (y * (y + 1)) ≥ 0 := Real.sqrt_nonneg (y * (y + 1))
  have h₁₀ : (x + 1) ^ 2 ≥ (Real.sqrt (y * (y + 1))) ^ 2 := by sorry
  have h₁₁ : x + 1 ≥ Real.sqrt (y * (y + 1)) ∨ x + 1 ≤ -Real.sqrt (y * (y + 1)) := by sorry
  exact h₁₁