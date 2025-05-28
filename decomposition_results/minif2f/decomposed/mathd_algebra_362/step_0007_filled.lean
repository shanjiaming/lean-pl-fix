theorem h₅ (a b : ℝ) (h₀ : a ^ 2 * b ^ 3 = 32 / 27) (h₁ : a / b ^ 3 = 27 / 4) (hb3 : b ≠ 0) (h₂ : b ^ 3 ≠ 0) (h₄ : a / b ^ 3 = 27 / 4) : a = 27 / 4 * b ^ 3 := by
  --  --  field_simp at h₄ ⊢ <;> nlinarith [sq_pos_of_ne_zero hb3, sq_pos_of_ne_zero (pow_ne_zero 3 hb3)]
  hole