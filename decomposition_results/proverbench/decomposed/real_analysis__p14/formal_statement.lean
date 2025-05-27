/-- Application of Rolle's Theorem: If f is continuous on [a,b], differentiable on (a,b),
    and f(a) = f(b), then there exists c ∈ (a,b) such that f'(c) = 0. -/
theorem rolles_theorem_application (hab : a < b)
    {f : ℝ → ℝ}
    (h_cont : ContinuousOn f (Set.Icc a b))
    (h_diff : DifferentiableOn ℝ f (Set.Ioo a b))
    (h_eq : f a = f b) :
  ∃ c ∈ Set.Ioo a b, deriv f c = 0 :=