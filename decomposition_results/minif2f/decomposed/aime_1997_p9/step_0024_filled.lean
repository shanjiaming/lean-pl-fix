theorem h₈₇ (a : ℝ) (h₀ : 0 < a) (h₁ : 1 / a - ↑⌊1 / a⌋ = a ^ 2 - ↑⌊a ^ 2⌋) (h₂ : 2 < a ^ 2) (h₃ : a ^ 2 < 3) (h₄ : ⌊a ^ 2⌋ = 2) (h₅ : ⌊1 / a⌋ = 0) (h₆ : 1 / a = a ^ 2 - 2) (h₇ : a ^ 3 - 2 * a - 1 = 0) (h₈₁ : a ≠ 0) (h₈₂ h₈₄ : a ^ 3 - 2 * a - 1 = 0) (h₈₅ : (a + 1) * (a ^ 2 - a - 1) = 0) (h₈₆ : a + 1 > 0) : a ^ 2 - a - 1 = 0 :=
  by
  --  apply mul_left_cancel₀ (show (a + 1 : ℝ) ≠ 0 by nlinarith)
  --  nlinarith
  nlinarith