theorem h₂ (h₁ : heightFunction 2.5 = 40 * 2.5 - 16 * 2.5 ^ 2) : 40 * 2.5 - 16 * 2.5 ^ 2 = 0 := by
  norm_num [heightFunction] <;> ring_nf at * <;> norm_num <;> linarith