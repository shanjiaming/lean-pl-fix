theorem h_main (a b : ℝ) (hab : a < b) (f : ℝ → ℝ) (h_cont : ContinuousOn f (Set.Icc a b)) (h_diff : DifferentiableOn ℝ f (Set.Ioo a b)) (h_eq : f a = f b) : ∃ c ∈ Set.Ioo a b, deriv f c = 0 :=
  by
  have h₁ : ∃ c ∈ Set.Ioo a b, deriv f c = 0 := by sorry
  --  exact h₁
  hole