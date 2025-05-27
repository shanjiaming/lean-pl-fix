theorem h₂ (P : Polynomial ℝ) (h : ∀ (x : ℝ), Polynomial.eval x P ^ 2 - 2 = 2 * Polynomial.eval (2 * x ^ 2 - 1) P) (h₁ : P.degree ≤ 0) : P.degree ≤ 0 := by -- exact h₁
  hole