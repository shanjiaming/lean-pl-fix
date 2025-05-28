theorem h₅₁₀ (a b : NNReal) (h₀ : 0 < a ∧ 0 < b) (h₁ : a ^ 2 = 6 * b) (h₂ : a ^ 2 = 54 / b) (h₃ : ↑b = 3) (h₄ : ↑a ^ 2 = 18) (h₅₁ : 0 < ↑a) (h₅₂ : 0 < √2) (h₅₃ : 0 < 3 * √2) (h₅₄ : ↑a ^ 2 = 18) (h₅₅ : ↑a > 0) (h₅₇ : ↑a ^ 2 = 18) (h₅₈ : 0 < √2) (h₅₉ : ↑a > 0) : ↑a = 3 * √2 := by
  --  nlinarith [Real.sq_sqrt (show 0 ≤ 2 by norm_num), mul_self_nonneg ((a : ℝ) - 3 * Real.sqrt 2)]
  hole