theorem polynomial_solution_unique (h : P^2 - C 2 = C 2 * eval₂ C (2 * X^2 - C 1) P) :
  P = C (1 + Real.sqrt 3) ∨ P = C (1 - Real.sqrt 3) :=