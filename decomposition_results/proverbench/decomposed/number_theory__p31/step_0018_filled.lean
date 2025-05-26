theorem h₅ (x y : ℤ) (hx : 2 < x) (hy : 2 < y) (z : ℤ) (hz : x ^ 2 + 1 = z * (y ^ 2 - 5)) (h₁ : y = 3 → False) (h₂ : y = 4 → False) (h_y h₄ : y ≥ 5) : y ≥ 5 := by -- exact_mod_cast h₄
  linarith