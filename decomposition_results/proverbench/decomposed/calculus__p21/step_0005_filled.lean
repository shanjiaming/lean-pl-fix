theorem h₃ (x y z : ℝ) (h : x ^ 2 + y ^ 2 + z ^ 2 = 1) (h₀ : f (x, y, z) ≤ 1) (h₂ : f (x, y, z) = 1) : x * y + y * z + z * x = 1 := by -- simpa [f] using h₂
  simpa