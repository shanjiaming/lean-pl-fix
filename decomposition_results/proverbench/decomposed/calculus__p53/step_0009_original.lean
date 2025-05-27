theorem h₃ (a b : ℝ) (h_a : a = 100) (h_b : b = 200) (h₁✝ : a = 100) (h₂✝ : b = 200) (x : ℝ) (h₁ : x ^ 2 - 7 * x + 12 = (x - 4) * (x - 3)) (h₂ : x ≠ 4) : x ≠ 3 := by
  intro h
  norm_num [h] at * <;> linarith