theorem h_false  : False :=
  by
  have h₁ : Real.sqrt 2 = 0 := by sorry
  have h₂ : Real.sqrt 2 > 0 := Real.sqrt_pos.mpr (by norm_num)
  --  linarith
  linarith