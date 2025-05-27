theorem h₂ (h₁ : f.IsRoot 1) : ∀ (y : Z2), f.IsRoot y → y = 1 := by
  --  intro y h_y
  have h₃ : y = 0 ∨ y = 1 := by sorry
  --  cases h₃ with
  --  | inl h₃ =>
  --    exfalso
  --    have h₄ : eval y f = 0 := h_y
  --    rw [h₃] at h₄
  --    have h₅ : eval (0 : Z2) f ≠ 0 := f_zero_ne_zero
  --    simp_all [f, eval_add, eval_pow, eval_C, eval_X, pow_two, add_zero, mul_zero] <;> aesop
  --  | inr h₃ => simp_all [f, eval_add, eval_pow, eval_C, eval_X, pow_two, add_zero, mul_zero] <;> aesop
  hole