theorem h₄ (a b : ℝ) (h₀ : (27 / 4 * b ^ 3) ^ 2 * b ^ 3 = 32 / 27) (h₁ : a / b ^ 3 = 27 / 4) (hb3 : b ≠ 0) (a_eq h₂ : a = 27 / 4 * b ^ 3) (h₃ : (27 / 4 * b ^ 3) ^ 2 * b ^ 3 = 32 / 27) : b ^ 9 = (2 / 3) ^ 9 := by
  ring_nf at h₃ ⊢ <;>
    nlinarith [sq_pos_of_ne_zero hb3, sq_pos_of_ne_zero (pow_ne_zero 3 hb3), sq_pos_of_ne_zero (pow_ne_zero 2 hb3),
      sq_pos_of_ne_zero (pow_ne_zero 5 hb3), sq_pos_of_ne_zero (pow_ne_zero 6 hb3),
      sq_pos_of_ne_zero (pow_ne_zero 7 hb3), sq_pos_of_ne_zero (pow_ne_zero 8 hb3),
      sq_pos_of_ne_zero (pow_ne_zero 9 hb3)]