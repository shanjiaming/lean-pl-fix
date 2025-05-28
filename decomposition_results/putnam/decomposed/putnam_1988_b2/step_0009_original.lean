theorem h₁₁ (x y : ℝ) (h : y ≥ 0 ∧ y * (y + 1) ≤ (x + 1) ^ 2) (h₁ : y ≥ 0) (h₂ : y * (y + 1) ≤ (x + 1) ^ 2) (h₃ : ¬y ≤ 1) (h₄ : y > 1) (h₅ h₇ : (x + 1) ^ 2 ≥ y * (y + 1)) (h₉ : √(y * (y + 1)) ≥ 0) (h₁₀ : (x + 1) ^ 2 ≥ √(y * (y + 1)) ^ 2) : x + 1 ≥ √(y * (y + 1)) ∨ x + 1 ≤ -√(y * (y + 1)) :=
  by
  by_cases h₁₂ : x + 1 ≥ Real.sqrt (y * (y + 1))
  · exact Or.inl h₁₂
  ·
    have h₁₃ : x + 1 < Real.sqrt (y * (y + 1)) := by sorry
    have h₁₄ : x + 1 ≤ -Real.sqrt (y * (y + 1)) := by sorry
    exact Or.inr h₁₄