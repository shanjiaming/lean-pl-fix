theorem h₄ (b h : ℝ) (hbh : b > 0 ∧ h > 0 ∧ b ^ 2 + h ^ 2 = 2 ^ 2) (areaeq : b * h = 0.5 * b * (1 - h / 2)) (h₂ : b > 0) (h₃ : b ≠ 0) : h = 0.5 * (1 - h / 2) :=
  by
  apply mul_left_cancel₀ (show (b : ℝ) ≠ 0 by linarith)
  ring_nf at areaeq ⊢
  nlinarith