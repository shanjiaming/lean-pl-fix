theorem h₁₃ (x a b : ℝ) (h₂ : a < b) (h₃ : a = (21 - √497) / 4) (h₄ : b = (21 + √497) / 4) (h₅ : ∀ (x : ℝ), deriv (deriv f) x = 0 ↔ x = a ∨ x = b) (h₆ : a < b) (h₇ : a = (21 - √497) / 4) (h₈ : b = (21 + √497) / 4) (h₉ : ∀ (x : ℝ), deriv (deriv f) x = 0 ↔ x = a ∨ x = b) (h₁₀ : a < 0) (h₁₁ : deriv (deriv f) (a - 1) > 0) (h₁₂ : ∀ x < a, deriv (deriv f) x > 0) : b > 21 / 4 := by
  have h₁₃₁ : b = (21 + Real.sqrt 497) / 4 := h₈
  have h₁₃₂ : Real.sqrt 497 > 0 := by sorry
  --  rw [h₁₃₁]
  --  nlinarith [Real.sqrt_nonneg 497, Real.sq_sqrt (show 0 ≤ 497 by norm_num)]
  linarith