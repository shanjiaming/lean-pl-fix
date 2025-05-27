theorem h₃ (P : Polynomial ℝ) (h : ∀ (x : ℝ), Polynomial.eval x P ^ 2 - 2 = 2 * Polynomial.eval (2 * x ^ 2 - 1) P) (h₁ h₂ : P.degree ≤ 0) : ∃ a, P = Polynomial.C a := by
  have h₄ : P.degree ≤ 0 := by sorry
  have h₅ : ∃ a : ℝ, P = Polynomial.C a := by sorry
  --  exact h₅
  hole