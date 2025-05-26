theorem h₄ (c : ℝ) (h : c ≥ 1 / 2) (x : ℝ) (h₂ : cosh x ≤ rexp (x ^ 2 / 2)) : x ^ 2 / 2 ≤ c * x ^ 2 := by
  have h₅ : c ≥ 1 / 2 := h
  have h₆ : x ^ 2 / 2 ≤ c * x ^ 2 := by sorry
  exact h₆