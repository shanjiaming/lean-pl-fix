theorem h₅ (P : Polynomial ℝ) (h : ∀ (x : ℝ), Polynomial.eval x P ^ 2 - 2 = 2 * Polynomial.eval (2 * x ^ 2 - 1) P) (h₁ h₂ h₄ : P.degree ≤ 0) : ∃ a, P = Polynomial.C a := by
  have h₆ : P.degree ≤ 0 := h₄
  have h₇ : ∃ a : ℝ, P = Polynomial.C a := by sorry
  --  exact h₇
  hole