theorem h₁ (x : ℝ) : ∫ (x : ℝ) in Set.Icc 0 (π / 2), log (sin x) = -(π / 2) * log 2 :=
  by
  have h₂ : ∫ x in Set.Icc 0 (π / 2), Real.log (Real.sin x) = -(π / 2) * Real.log 2 := by sorry
  --  exact h₂
  hole