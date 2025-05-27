theorem exactly_one_has_integral_solution:
  (∃ (x y : ℤ), x^2 - p * y^2 = 2) ∨ (∃ (x y : ℤ), x^2 - p * y^2 = -2) ∧
  ¬((∃ (x y : ℤ), x^2 - p * y^2 = 2) ∧ (∃ (x y : ℤ), x^2 - p * y^2 = -2)) :=