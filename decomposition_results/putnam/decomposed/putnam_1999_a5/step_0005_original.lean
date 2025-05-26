theorem h₃ (p : Polynomial ℝ) (hpdeg : p.degree = 1999) : p ≠ 0 := by
  intro h
  rw [h] at hpdeg
  norm_num [Polynomial.degree_zero] at hpdeg <;> contradiction