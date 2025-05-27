theorem h₁ (x y z : ℝ) (hx : 0 < x) (hy : 0 < y) (hz : 0 < z) (h : x + y + z = x * y * z) : 0 < x * y := by
  have h₁ : 0 < x * y := mul_pos hx hy
  exact h₁