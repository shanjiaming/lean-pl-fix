theorem h₃ (x : ℝ) : ∫ (x : ℝ) in Set.Icc 0 (π / 2), log (sin x) = -(π / 2) * log 2 :=
  by
  have h₄ : ∫ x in Set.Icc 0 (π / 2), Real.log (Real.sin x) = -(π / 2) * Real.log 2 := by sorry
  --  exact h₄
  hole