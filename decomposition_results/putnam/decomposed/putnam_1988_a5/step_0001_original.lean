theorem putnam_1988_a5  : ∃ f,
    (∀ x > 0, f (f x) = 6 * x - f x ∧ f x > 0) ∧
      ∀ (g : ℝ → ℝ), (∀ x > 0, g (g x) = 6 * x - g x ∧ g x > 0) → ∀ x > 0, f x = g x :=
  by
  have h_main :
    ∃ (f : ℝ → ℝ),
      (∀ x > 0, f (f x) = 6 * x - f x ∧ f x > 0) ∧
        (∀ (g : ℝ → ℝ), (∀ x > 0, g (g x) = 6 * x - g x ∧ g x > 0) → (∀ x > 0, f x = g x)) := by sorry
  exact h_main