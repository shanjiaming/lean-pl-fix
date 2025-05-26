theorem h_numerator (h_denominator : 2.5 - 2 = 1 / 2) : sorry - sorry = -16 :=
  by
  have h₁ : heightFunction 2.5 = 0 := heightAtTwoPointFive
  have h₂ : heightFunction 2 = 16 := heightAtTwo
  --  rw [h₁, h₂] <;> norm_num <;> linarith
  hole