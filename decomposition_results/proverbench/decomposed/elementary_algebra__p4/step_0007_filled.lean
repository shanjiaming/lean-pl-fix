theorem h₅ (x y : ℚ) (h : 2 * x + 3 * y = 8 ∧ 5 * x + 9 * y = -2) (h₁ : x = 26) (h₃ : 2 * x + 3 * y = 8) (h₄ : 5 * x + 9 * y = -2) : y = -44 / 3 := by
  have h₆ : x = 26 := h₁
  --  rw [h₆] at h₃ h₄
  --  ring_nf at h₃ h₄ ⊢
  --  linarith
  linarith