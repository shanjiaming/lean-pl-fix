theorem h₁ (f : ℝ → ℝ) : ∫ (x : ℝ) in Icc 0 (π / 2), x * sin x = 1 :=
  by
  have h₂ : (∫ x in (0 : ℝ)..(π / 2 : ℝ), x * sin x) = 1 := by sorry
  have h₃ : (∫ x in Icc 0 (π / 2), x * sin x) = (∫ x in (0 : ℝ)..(π / 2 : ℝ), x * sin x) := by sorry
  --  rw [h₃]
  --  rw [h₂]
  hole