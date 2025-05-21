theorem rolles_theorem_application (hab : a < b)
    {f : ℝ → ℝ}
    (h_cont : ContinuousOn f (Set.Icc a b))
    (h_diff : DifferentiableOn ℝ f (Set.Ioo a b))
    (h_eq : f a = f b) :
  ∃ c ∈ Set.Ioo a b, deriv f c = 0 := by
  have h_main : ∃ c ∈ Set.Ioo a b, deriv f c = 0 := by
    -- Apply Rolle's Theorem using the given conditions
    have h₁ : ∃ c ∈ Set.Ioo a b, deriv f c = 0 := by
      apply exists_deriv_eq_zero _ hab h_cont h_diff
      <;> simp_all [h_eq]
    -- The result follows directly from the application of Rolle's Theorem
    exact h₁
  -- The main result is already obtained, so we just use it to conclude the proof
  exact h_main