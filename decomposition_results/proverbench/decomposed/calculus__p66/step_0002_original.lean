theorem h₀  : ∫ (x : ℝ) in Set.Icc 1 5, x * log x = (25 * log 5 - 12) / 2 :=
  by
  have h₁ : ∫ x in Set.Icc 1 5, x * Real.log x = ∫ x in (1 : ℝ)..5, x * Real.log x := by sorry
  rw [h₁]
  have h₂ : ∫ x in (1 : ℝ)..5, x * Real.log x = (25 * Real.log 5 - 12) / 2 := by sorry