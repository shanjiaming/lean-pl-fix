theorem putnam_1999_a5  : ∃ C, ∀ (p : Polynomial ℝ), p.degree = 1999 → ‖Polynomial.eval 0 p‖ ≤ C * ∫ (x : ℝ) in -1 ..1, ‖Polynomial.eval x p‖ :=
  by
  have h_main : ∃ (C : ℝ), ∀ (p : Polynomial ℝ), p.degree = 1999 → ‖p.eval 0‖ ≤ C * ∫ x in (-1)..1, ‖p.eval x‖ := by sorry
  exact h_main