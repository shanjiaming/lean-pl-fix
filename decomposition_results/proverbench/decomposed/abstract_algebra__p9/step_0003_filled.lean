theorem h₂ (x y z : ℝ) (hx : 0 < x) (hy : 0 < y) (hz : 0 < z) (h : x + y + z = x * y * z) (h₁ : 0 < x * y) : 0 < y * z := by
  have h₂ : 0 < y * z := mul_pos hy hz
  --  exact h₂
  linarith