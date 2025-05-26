theorem h₅ (h : 2 * sorry + 3 * sorry = 8 ∧ 5 * sorry + 9 * sorry = -2) (h₁ : sorry = 26) (h₃ : 2 * sorry + 3 * sorry = 8) (h₄ : 5 * sorry + 9 * sorry = -2) : sorry = -44 / 3 := by
  have h₆ : x = 26 := h₁
  rw [h₆] at h₃ h₄
  ring_nf at h₃ h₄ ⊢
  linarith