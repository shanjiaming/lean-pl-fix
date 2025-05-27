theorem heightAtTwo  : heightFunction 2 = 16 :=
  by
  have h₁ : heightFunction 2 = 40 * (2 : ℝ) - 16 * (2 : ℝ) ^ 2 := by sorry
  have h₂ : heightFunction 2 = 16 := by sorry
  --  apply h₂ <;> try norm_num
  linarith