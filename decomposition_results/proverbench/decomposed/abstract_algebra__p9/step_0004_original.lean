theorem h₃ (x y z : ℝ) (hx : 0 < x) (hy : 0 < y) (hz : 0 < z) (h : x + y + z = x * y * z) (h₁ : 0 < x * y) (h₂ : 0 < y * z) : 0 < z * x := by
  have h₃ : 0 < z * x := mul_pos hz hx
  exact h₃