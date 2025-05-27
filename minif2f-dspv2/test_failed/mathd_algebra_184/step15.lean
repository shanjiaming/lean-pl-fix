theorem h₅₆ (a b : NNReal) (h₀ : 0 < a ∧ 0 < b) (h₁ : a ^ 2 = 6 * b) (h₂ : a ^ 2 = 54 / b) (h₃ : (↑b : ℝ) = 3) (h₄ : (↑a : ℝ) ^ 2 = 18) (h₅₁ : 0 < (↑a : ℝ)) (h₅₂ : 0 < √2) (h₅₃ : 0 < 3 * √2) (h₅₄ : (↑a : ℝ) ^ 2 = 18) (h₅₅ : (↑a : ℝ) > 0) : (↑a : ℝ) = 3 * √2 := by
  apply Eq.symm
  nlinarith [Real.sq_sqrt (show 0 ≤ 2 by norm_num), Real.sqrt_nonneg 2, mul_self_nonneg ((a : ℝ) - 3 * Real.sqrt 2),
    mul_self_nonneg ((a : ℝ) + 3 * Real.sqrt 2)]