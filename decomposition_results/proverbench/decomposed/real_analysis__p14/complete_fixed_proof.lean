theorem rolles_theorem_application (hab : a < b) {f : ℝ → ℝ} (h_cont : ContinuousOn f (Set.Icc a b))
  (h_diff : DifferentiableOn ℝ f (Set.Ioo a b)) (h_eq : f a = f b) : ∃ c ∈ Set.Ioo a b, deriv f c = 0:=
  by
  have h_main : ∃ c ∈ Set.Ioo a b, deriv f c = 0:=
    by
    have h₁ : ∃ c ∈ Set.Ioo a b, deriv f c = 0:= by -- apply exists_deriv_eq_zero _ hab h_cont h_diff <;> simp_all [h_eq]
      hole
    --  exact h₁
    simpa
  --  exact h_main
  simpa