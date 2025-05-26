theorem h₂ (p : Polynomial ℝ) (hpdeg : p.degree = 1999) : ∫ (x : ℝ) in -1 ..1, ‖Polynomial.eval x p‖ ≥ 2 * ‖Polynomial.eval 0 p‖ :=
  by
  have h₃ : p ≠ 0 := by sorry
  have h₄ : (∫ x in (-1)..1, ‖p.eval x‖ : ℝ) ≥ 2 * ‖p.eval 0‖ := by sorry
  linarith