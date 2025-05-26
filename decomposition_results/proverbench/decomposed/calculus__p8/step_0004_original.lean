theorem h₃ (h1 :  ∫ (x : ℝ) in Set.Icc (-√7) √7,      ∫ (y : ℝ) in Set.Icc (-√(7 - x ^ 2)) √(7 - x ^ 2), x ^ 2 + y ^ 2 + 2 * (7 - x ^ 2 - y ^ 2) =    147 / 2 * π) (h : (957 * √29 - 47) / 20 * π = 147 / 2 * π) : (957 * √29 - 47) / 20 = 147 / 2 :=
  by
  apply mul_left_cancel₀ (show (Real.pi : ℝ) ≠ 0 by exact Real.pi_ne_zero)
  linarith