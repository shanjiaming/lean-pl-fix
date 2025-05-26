theorem h₄ (z : ℂ) (hzrat : ∃ q1 q2, z.re = (↑q1 : ℝ) ∧ z.im = (↑q2 : ℝ)) (hznorm : ‖z‖ = 1) (n : ℤ) (h₃ : z ^ (2 * n) = (z ^ n) ^ 2) : star z ^ n = star (z ^ n) := by -- simp [star_pow]
  hole