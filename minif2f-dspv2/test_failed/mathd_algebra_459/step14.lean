theorem h₄ (a b c d : ℚ) (h₀ : 3 * a = b + c + d) (h₁ : 4 * b = a + c + d) (h₂ : 2 * c = a + b + d) (h₃ : 8 * a + 10 * b + 6 * c = 24) (h₅b_eq_4a : 5 * b = 4 * a) (h₃c_eq_4a : 3 * c = 4 * a) (h_a_eq_1 : a = 1) : b = 4 / 5 := by
  have h₅ : 5 * b = 4 * a := h₅b_eq_4a
  have h₆ : a = 1 := h_a_eq_1
  rw [h₆] at h₅
  norm_num at h₅ ⊢ <;> linarith