theorem h₂ (x : ℝ) (h₁ : ∀ (x : ℝ), f x = 1) : ContinuousOn f (Set.Icc 0 8) :=
  by
  have h₃ : f = fun _ => 1 := by sorry
  rw [h₃]
  exact continuousOn_const