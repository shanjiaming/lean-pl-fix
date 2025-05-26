theorem h_main (I J : (ℝ → ℝ) → ℝ) (hI : I = fun f => ∫ (x : ℝ) in 0 ..1, x ^ 2 * f x) (hJ : J = fun f => ∫ (x : ℝ) in 0 ..1, x * f x ^ 2) (h₁ : 1 / 16 ∈ {y | ∃ f, ContinuousOn f sorry ∧ I f - J f = y}) (h₂ : ∀ y ∈ {y | ∃ f, ContinuousOn f sorry ∧ I f - J f = y}, y ≤ 1 / 16) : IsGreatest {y | ∃ f, ContinuousOn f sorry ∧ I f - J f = y} (1 / 16) :=
  by
  refine' ⟨h₁, _⟩
  intro y hy
  have h₃ : y ≤ (1 / 16 : ℝ) := h₂ y hy
  exact h₃