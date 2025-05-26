theorem h₁ (p : Polynomial ℝ) (hpdeg : p.degree = 1999) : ‖Polynomial.eval 0 p‖ ≤ 1 / 2 * ∫ (x : ℝ) in -1 ..1, ‖Polynomial.eval x p‖ :=
  by
  have h₂ : ∫ x in (-1)..1, ‖p.eval x‖ ≥ 2 * ‖p.eval 0‖ := by sorry
  have h₃ : ‖p.eval 0‖ ≤ (1 / 2 : ℝ) * ∫ x in (-1)..1, ‖p.eval x‖ := by sorry
  linarith
  hole