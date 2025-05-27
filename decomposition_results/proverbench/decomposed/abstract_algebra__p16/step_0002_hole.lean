theorem h_constant (P : ℝ[X]) (h : ∀ (x : ℝ), eval x P ^ 2 - 1 = 4 * eval (x ^ 2 - 4 * x + 1) P) : P.degree ≤ 0 := by
  --  by_contra h₁
  have h₂ : P.degree ≥ 1 := by sorry
  have h₃ : P.leadingCoeff = 4 := by sorry
  have h₄ : P.leadingCoeff = 4 := h₃
  have h₅ : P.degree ≥ 1 := h₂
  have h₆ : P ≠ 0 := by sorry
  have h₇ := Polynomial.degree_eq_natDegree h₆
  have h₈ : P.natDegree ≥ 1 := by sorry
  have h₉ : P.leadingCoeff = 4 := h₃
  have h₁₀ : P.degree ≥ 1 := h₂
  have h₁₁ : P ≠ 0 := by sorry
  have h₁₂ := h 0
  have h₁₃ := h 1
  have h₁₄ := h (-2)
  have h₁₅ := h 2
  have h₁₆ := h 3
  have h₁₇ : P.degree ≥ 1 := h₂
  have h₁₈ : P ≠ 0 := by sorry
  have h₁₉ := Polynomial.degree_eq_natDegree h₁₈
  have h₂₀ : P.natDegree ≥ 1 := by sorry
  --  simp_all [Polynomial.leadingCoeff, Polynomial.coeff_natDegree_eq_zero_of_degree_lt] <;> norm_num at * <;>
    nlinarith [Real.sqrt_nonneg 5, Real.sq_sqrt (show 0 ≤ 5 by norm_num)]
  hole