theorem h₁ (x✝ x : ℝ) : deriv (deriv f) x = (50 * x ^ 2 - 525 * x - 175) / (5 * x ^ 2 + 35) ^ (5 / 2) := by
  rw [f_second_deriv] <;> ring_nf <;> field_simp <;> ring_nf
  hole