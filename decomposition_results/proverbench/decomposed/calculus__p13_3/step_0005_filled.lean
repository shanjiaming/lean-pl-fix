theorem h₃ (h₁ : cos (π / 3) = 1 / 2) (h₂ : tan (π / 3) = √3) : (1 / cos (π / 3)) ^ 2 = 4 := by -- -- rw [h₁] <;> norm_num <;> linarith [Real.pi_pos]
  norm_num