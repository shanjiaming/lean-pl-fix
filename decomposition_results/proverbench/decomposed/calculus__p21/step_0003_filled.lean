theorem h₂ (x y z : ℝ) (h : x ^ 2 + y ^ 2 + z ^ 2 = 1) (h₁ : f (x, y, z) = x * y + y * z + z * x) : 0 ≤ (x - y) ^ 2 + (y - z) ^ 2 + (z - x) ^ 2 := by -- nlinarith
  nlinarith