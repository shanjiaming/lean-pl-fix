theorem h_final (P : Polynomial ℝ) (h_main :  (Polynomial.eval 0 P = 0 ∧ ∀ (x : ℝ), Polynomial.eval (x ^ 2 + 1) P = Polynomial.eval x P ^ 2 + 1) →    P ∈ {Polynomial.X}) (h_trivial :  P ∈ {Polynomial.X} → Polynomial.eval 0 P = 0 ∧ ∀ (x : ℝ), Polynomial.eval (x ^ 2 + 1) P = Polynomial.eval x P ^ 2 + 1) : (Polynomial.eval 0 P = 0 ∧ ∀ (x : ℝ), Polynomial.eval (x ^ 2 + 1) P = Polynomial.eval x P ^ 2 + 1) ↔
    P ∈ {Polynomial.X} :=
  by
  constructor
  · intro h
    exact h_main h
  · intro h
    exact h_trivial h