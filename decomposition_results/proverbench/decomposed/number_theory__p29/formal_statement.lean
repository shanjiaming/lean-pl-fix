theorem rational_solution_equivalence (h : x ≠ 1) :
  (x^2 - d * y^2 = 1) ↔ ∃ t : ℚ, x = (d * t^2 + 1) / (d * t^2 - 1) ∧ y = 2 * t / (d * t^2 - 1) :=