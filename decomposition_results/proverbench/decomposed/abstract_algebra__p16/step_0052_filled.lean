theorem h₂₀ (P : ℝ[X]) (h : ∀ (x : ℝ), eval x P ^ 2 - 1 = 4 * eval (x ^ 2 - 4 * x + 1) P) (h₁ : ¬P.degree ≤ 0) (h₂ : P.degree ≥ 1) (h₃ h₄ : P.leadingCoeff = 4) (h₅ : P.degree ≥ 1) (h₆ : P ≠ 0) (h₇ : P.degree = ↑P.natDegree) (h₈ : P.natDegree ≥ 1) (h₉ : P.leadingCoeff = 4) (h₁₀ : P.degree ≥ 1) (h₁₁ : P ≠ 0) (h₁₂ : eval 0 P ^ 2 - 1 = 4 * eval (0 ^ 2 - 4 * 0 + 1) P) (h₁₃ : eval 1 P ^ 2 - 1 = 4 * eval (1 ^ 2 - 4 * 1 + 1) P) (h₁₄ : eval (-2) P ^ 2 - 1 = 4 * eval ((-2) ^ 2 - 4 * -2 + 1) P) (h₁₅ : eval 2 P ^ 2 - 1 = 4 * eval (2 ^ 2 - 4 * 2 + 1) P) (h₁₆ : eval 3 P ^ 2 - 1 = 4 * eval (3 ^ 2 - 4 * 3 + 1) P) (h₁₇ : P.degree ≥ 1) (h₁₈ : P ≠ 0) (h₁₉ : P.degree = ↑P.natDegree) : P.natDegree ≥ 1 := by
  --  by_contra h₂₁
  have h₂₂ : P.natDegree = 0 := by sorry
  have h₂₃ : P.degree ≤ 0 := by sorry
  --  simp_all [Polynomial.degree_eq_natDegree] <;> norm_num <;> linarith
  linarith