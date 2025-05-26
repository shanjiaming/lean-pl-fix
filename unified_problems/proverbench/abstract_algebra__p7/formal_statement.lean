theorem polynomial_equation_solution :
  (∀ x, P.eval x ^ 2 - 2 = 2 * P.eval (2 * x ^ 2 - 1)) ↔
  ∃ a : ℝ , a ^ 2 - 2 * a - 2 = 0 ∧ P = Polynomial.C a :=