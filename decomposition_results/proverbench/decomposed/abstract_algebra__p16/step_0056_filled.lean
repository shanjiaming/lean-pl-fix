theorem h₂ (P : ℝ[X]) (h : ∀ (x : ℝ), eval x P ^ 2 - 1 = 4 * eval (x ^ 2 - 4 * x + 1) P) (h_constant h₁ : P.degree ≤ 0) : ∃ c, P = C c := by -- exact Polynomial.degree_le_zero_iff.mp h₁
  hole