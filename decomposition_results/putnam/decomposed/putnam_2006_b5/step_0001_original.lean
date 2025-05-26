theorem putnam_2006_b5 (I J : (ℝ → ℝ) → ℝ) (hI : I = fun f => ∫ (x : ℝ) in 0 ..1, x ^ 2 * f x) (hJ : J = fun f => ∫ (x : ℝ) in 0 ..1, x * f x ^ 2) : IsGreatest {y | ∃ f, ContinuousOn f sorry ∧ I f - J f = y} (1 / 16) :=
  by
  have h₁ : (1 / 16 : ℝ) ∈ {y | ∃ f : ℝ → ℝ, ContinuousOn f (Icc 0 1) ∧ I f - J f = y} := by sorry
  have h₂ : ∀ (y : ℝ), y ∈ {y | ∃ f : ℝ → ℝ, ContinuousOn f (Icc 0 1) ∧ I f - J f = y} → y ≤ (1 / 16 : ℝ) := by sorry
  have h_main : IsGreatest {y | ∃ f : ℝ → ℝ, ContinuousOn f (Icc 0 1) ∧ I f - J f = y} ((1 / 16 : ℝ)) := by sorry
  exact h_main