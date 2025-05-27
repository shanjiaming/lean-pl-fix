theorem unique_constant_solutions (h : ∀ x, P.eval x ^ 2 - 1 = 4 * P.eval (x ^ 2 - 4 * x + 1)) :
  P = C (2 + Real.sqrt 5) ∨ P = C (2 - Real.sqrt 5) :=