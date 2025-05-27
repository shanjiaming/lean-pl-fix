theorem h₅ (P : Polynomial ℝ) (h : ∀ (x : ℝ), Polynomial.eval x P ^ 2 - 2 = 2 * Polynomial.eval (2 * x ^ 2 - 1) P) (h₁ h₂ : P.degree ≤ 0) (a : ℝ) (ha : P = Polynomial.C a) : ∀ (x : ℝ), Polynomial.eval x P ^ 2 - 2 = 2 * Polynomial.eval (2 * x ^ 2 - 1) P :=
  by
  --  intro x
  --  apply h
  hole