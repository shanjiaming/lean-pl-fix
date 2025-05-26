theorem h₁₁ (x y : ℤ) (hx : 2 < x) (hy : 2 < y) (z : ℤ) (hz : x ^ 2 + 1 = z * (y ^ 2 - 5)) (h₁ : y = 3 → False) (h₂ : y = 4 → False) (h₃ : y ≥ 5 → False) (h₅ : ¬y = 3) (h₈ : ¬y = 4) : y ≥ 5 := by
  have h₁₂ : y > 2 := hy
  have h₁₃ : y ≠ 3 := h₅
  have h₁₄ : y ≠ 4 := h₈
  have h₁₅ : y ≥ 5 := by sorry
  --  exact h₁₅
  hole