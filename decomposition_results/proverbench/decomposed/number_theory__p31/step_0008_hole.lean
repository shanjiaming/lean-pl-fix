theorem h9 (x y : ℤ) (hx : 2 < x) (hy : 2 < y) (z : ℤ) (hz : x ^ 2 + 1 = z * (3 ^ 2 - 5)) (h_y_eq_3 h2 : y = 3) (h3 : x ^ 2 + 1 = z * (3 ^ 2 - 5)) (h4 : x ^ 2 + 1 = z * 4) (h5 : (x ^ 2 + 1) % 4 = 0) (h6 h8 : x % 4 = 0) : x ^ 2 % 4 = 0 := by
  have h10 : (x : ℤ) % 4 = 0 := h8
  have h11 : (x ^ 2 : ℤ) % 4 = 0 := by sorry
  --  exact h11
  hole