theorem h₆ (x y : ℤ) (hx : 2 < x) (hy : 2 < y) (z : ℤ) (hz : x ^ 2 + 1 = z * (y ^ 2 - 5)) (h₁ : y = 3 → False) (h₂ : y = 4 → False) (h_y h₄ h₅ : y ≥ 5) : y ^ 2 - 5 > 0 := by -- nlinarith
  nlinarith