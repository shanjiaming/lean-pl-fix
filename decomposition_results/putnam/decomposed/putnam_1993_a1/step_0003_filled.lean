theorem h₂ (h₁ : 0 < 4 / 9) : 4 / 9 < 4 * √2 / 9 :=
  by
  have h₂₁ : Real.sqrt 2 > 1 := by sorry
  have h₂₂ : (4 : ℝ) / 9 < (4 * Real.sqrt 2) / 9 := by sorry
  --  linarith
  linarith