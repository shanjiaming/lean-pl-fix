theorem heightAtTwo : heightFunction 2 = 16:=
  by
  have h₁ : heightFunction 2 = 40 * (2 : ℝ) - 16 * (2 : ℝ) ^ 2:= by -- unfold heightFunction <;> norm_num
    hole
  have h₂ : heightFunction 2 = 16:= by -- rw [h₁] <;> norm_num <;> rfl
    hole
  --  apply h₂ <;> try norm_num
  hole