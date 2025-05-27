theorem rational_solutions_of_pell_equation (t : ℚ) :
  ∃ (x y : ℚ), x = (d * t^2 + 1) / (d * t^2 - 1) ∧ y = 2 * t / (d * t^2 - 1) ∧ x^2 - d * y^2 = 1 :=