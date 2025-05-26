theorem aime_2024i_p2 (x y : ℝ) (hx : 1 < x) (hy : 1 < y)
    (h₁ : Real.logb x (y ^ x) = 10) (h₂ : Real.logb y (x ^ (4 * y)) = 10) :
    x * y = 25 := by