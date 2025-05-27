theorem h₁ (x : ℝ) (h : f_deriv x = 0) : 3 * x ^ 2 - 18 * x + 24 = 0 := by
  --  simp only [f_deriv] at h ⊢
  --  linarith
  simpa