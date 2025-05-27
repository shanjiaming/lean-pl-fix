theorem h₃ (P : ℝ[X]) (h : ∀ (x : ℝ), eval x P ^ 2 - 1 = 4 * eval (x ^ 2 - 4 * x + 1) P) (h₁ : ¬P.degree ≤ 0) : P.degree ≠ 0 := by
  --  intro h₄
  have h₅ : P.degree ≤ 0 := by sorry
  --  simp_all [Polynomial.degree_eq_natDegree] <;> norm_num <;> linarith
  norm_cast