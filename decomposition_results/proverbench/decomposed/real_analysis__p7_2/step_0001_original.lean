theorem f_continuous (x : ℝ) : ContinuousOn f (Set.Icc 0 8) :=
  by
  have h₁ : ∀ (x : ℝ), f x = 1 := by sorry
  have h₂ : ContinuousOn f (Set.Icc 0 8) := by sorry
  exact h₂