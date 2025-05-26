theorem h₁ (x : ℝ) : ∫ (y : ℝ) in Set.Icc 0 x, 1 / (y ^ 2 + 1) = arctan x - arctan 0 :=
  by
  have h₂ : ∫ y in Set.Icc 0 x, (1 : ℝ) / (y ^ 2 + 1) = ∫ y in 0..x, (1 : ℝ) / (y ^ 2 + 1) := by sorry
  rw [h₂]
  have h₃ : ∫ y in 0..x, (1 : ℝ) / (y ^ 2 + 1) = arctan x - arctan 0 := by sorry
  rw [h₃]