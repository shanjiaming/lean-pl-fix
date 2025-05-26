theorem h₂ (h₁✝ : sorry = 100) (h₂ : sorry = 200) (x : ℝ) (h₁ : x ^ 2 - 7 * x + 12 = (x - 4) * (x - 3)) : x ≠ 4 := by
  intro h
  norm_num [h] at * <;> linarith
  hole