theorem extrema_on_interval :
  ¬ ((∃ x : ℝ, x ∈ Set.Icc (-3) 3 ∧ (∀ y ∈ Set.Icc (-3) 3, f y ≤ f x) ∧ f x = 41/4 ∧ x = 3) ∧
  (∃ z : ℝ, z ∈ Set.Icc (-3) 3 ∧ (∀ y ∈ Set.Icc (-3) 3, f z ≤ f y) ∧ f z = - 13 / 3 ∧ z = -2)) :=