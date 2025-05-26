theorem h3 (x y : ℤ) (hx : 2 < x) (hy : 2 < y) (z : ℤ) (hz : x ^ 2 + 1 = z * (3 ^ 2 - 5)) (h_y_eq_3 h2 : y = 3) : x ^ 2 + 1 = z * (3 ^ 2 - 5) := by -- -- ring_nf at hz ⊢; linarith
  hole