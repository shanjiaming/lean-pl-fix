theorem h₄ (b h : ℝ) (hbh : b > 0 ∧ h > 0 ∧ b ^ 2 + h ^ 2 = 2 ^ 2) (areaeq : b * h = 0.5 * b * (1 - h / 2)) (h₁ : h = 0.5 * (1 - h / 2)) (h₂ : 2 * h = 1 - h / 2) : 4 * h = 2 - h := by
  have h₅ : 2 * h = 1 - h / 2 := h₂
  ring_nf at h₅ ⊢
  linarith