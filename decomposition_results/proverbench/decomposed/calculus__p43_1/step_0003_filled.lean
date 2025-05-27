theorem h₂ (h₁ : heightFunction 2 = 40 * 2 - 16 * 2 ^ 2) : heightFunction 2 = 16 := by -- -- rw [h₁] <;> norm_num <;> rfl
  linarith