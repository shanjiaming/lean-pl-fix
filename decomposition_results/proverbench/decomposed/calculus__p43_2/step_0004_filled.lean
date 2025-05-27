theorem h₃ (h₁ : heightFunction 2.5 = 40 * 2.5 - 16 * 2.5 ^ 2) (h₂ : 40 * 2.5 - 16 * 2.5 ^ 2 = 0) : heightFunction 2.5 = 0 := by
  --  rw [h₁]
  --  rw [h₂] <;> norm_num
  linarith