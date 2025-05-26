theorem h₃ (b h : ℝ) (hbh : b > 0 ∧ h > 0 ∧ b ^ 2 + h ^ 2 = 2 ^ 2) (areaeq : b * h = 0.5 * b * (1 - h / 2)) (h₂ : b > 0) : b ≠ 0 := by -- linarith
  linarith