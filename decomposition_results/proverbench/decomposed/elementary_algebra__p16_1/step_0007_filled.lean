theorem h₂ (r : ℝ) (h_forward : given_equation r → r = 7) (h h₁ : r = 7) : 2 = -12 + 2 * r := by
  --  rw [h₁]
  --  norm_num
  linarith