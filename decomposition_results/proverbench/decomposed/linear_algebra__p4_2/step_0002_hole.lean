theorem h₀ (A✝ A : Matrix (Fin 2) (Fin 4) ℝ) (j : Fin 4) (h : isPivotColumn A j) : j = 3 ∨ j ≠ 3 := by
  by_cases h₁ : j = 3
  · exact Or.inl h₁
  · exact Or.inr h₁
  hole