theorem h₀ (x y z : ℝ) (h : x ^ 2 + y ^ 2 + z ^ 2 = 1) : f (x, y, z) ≤ 1 := by
  have h₁ : f (x, y, z) = x * y + y * z + z * x := rfl
  --  rw [h₁]
  have h₂ : 0 ≤ (x - y) ^ 2 + (y - z) ^ 2 + (z - x) ^ 2 := by sorry
  --  nlinarith [sq_nonneg (x + y + z)]
  linarith