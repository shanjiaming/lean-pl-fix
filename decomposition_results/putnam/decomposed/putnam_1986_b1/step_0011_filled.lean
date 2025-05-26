theorem h₇ (b h : ℝ) (hbh : b > 0 ∧ h > 0 ∧ b ^ 2 + h ^ 2 = 2 ^ 2) (areaeq : b * h = 0.5 * b * (1 - h / 2)) (h₁ : h = 0.5 * (1 - h / 2)) (h₂ : 2 * h = 1 - h / 2) (h₃ : 4 * h = 2 - h) (h₄ h₆ : 5 * h = 2) : h = 2 / 5 := by
  --  apply mul_left_cancel₀ (show (5 : ℝ) ≠ 0 by norm_num)
  --  linarith
  linarith