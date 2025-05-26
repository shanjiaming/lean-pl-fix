theorem h_main  : ∃ C, ∀ (p : Polynomial ℝ), p.degree = 1999 → ‖Polynomial.eval 0 p‖ ≤ C * ∫ (x : ℝ) in -1 ..1, ‖Polynomial.eval x p‖ :=
  by
  use 1 / 2
  intro p hpdeg
  have h₁ : ‖p.eval 0‖ ≤ (1 / 2 : ℝ) * ∫ x in (-1)..1, ‖p.eval x‖ := by sorry
  exact h₁