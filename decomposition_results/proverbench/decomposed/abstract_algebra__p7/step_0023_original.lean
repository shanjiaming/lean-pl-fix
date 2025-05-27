theorem h_final (P : Polynomial ℝ) (h_main_implications :  (∀ (x : ℝ), Polynomial.eval x P ^ 2 - 2 = 2 * Polynomial.eval (2 * x ^ 2 - 1) P) →    ∃ a, a ^ 2 - 2 * a - 2 = 0 ∧ P = Polynomial.C a) (h_converse :  (∃ a, a ^ 2 - 2 * a - 2 = 0 ∧ P = Polynomial.C a) →    ∀ (x : ℝ), Polynomial.eval x P ^ 2 - 2 = 2 * Polynomial.eval (2 * x ^ 2 - 1) P) : (∀ (x : ℝ), Polynomial.eval x P ^ 2 - 2 = 2 * Polynomial.eval (2 * x ^ 2 - 1) P) ↔
    ∃ a, a ^ 2 - 2 * a - 2 = 0 ∧ P = Polynomial.C a :=
  by
  constructor
  · exact h_main_implications
  · exact h_converse