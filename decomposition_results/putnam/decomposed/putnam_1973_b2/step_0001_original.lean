theorem putnam_1973_b2 (z : ℂ) (hzrat : ∃ q1 q2, z.re = (↑q1 : ℝ) ∧ z.im = (↑q2 : ℝ)) (hznorm : ‖z‖ = 1) : ∀ (n : ℤ), ∃ q, ‖z ^ (2 * n) - 1‖ = (↑q : ℝ) :=
  by
  have h_main : ∀ n : ℤ, ∃ q : ℚ, ‖z ^ (2 * n) - 1‖ = q := by sorry
  exact h_main