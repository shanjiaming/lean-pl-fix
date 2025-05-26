theorem h₄ (x y : ℤ) (hx : 2 < x) (hy : 2 < y) (z : ℤ) (hz : x ^ 2 + 1 = z * (y ^ 2 - 5)) (h₁ : y = 3 → False) (h₂ : y = 4 → False) (h₃ : y ≥ 5 → False) : False := by
  --  by_cases h₅ : y = 3
  ·
    have h₆ : y = 3 := h₅
    have h₇ : False := h₁ h₆
  --    exact h₇
  --  · by_cases h₈ : y = 4
    ·
      have h₉ : y = 4 := h₈
      have h₁₀ : False := h₂ h₉
  --      exact h₁₀
    ·
      have h₁₁ : y ≥ 5 := by sorry
      have h₁₆ : False := h₃ h₁₁
  --      exact h₁₆
  hole