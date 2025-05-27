theorem paraboloid_integral_value :
  ∫ (x : ℝ) in Set.Icc (-Real.sqrt 7) (Real.sqrt 7),
      ∫ (y : ℝ) in Set.Icc (-Real.sqrt (7 - x ^ 2)) (Real.sqrt (7 - x ^ 2)), (x ^ 2 + y ^ 2 + 2 * (7 - x ^ 2 - y ^ 2)) =
    (957 * Real.sqrt 29 - 47) / 20 * π:=
  by
  have h1 :
    ∫ (x : ℝ) in Set.Icc (-Real.sqrt 7) (Real.sqrt 7),
        ∫ (y : ℝ) in Set.Icc (-Real.sqrt (7 - x ^ 2)) (Real.sqrt (7 - x ^ 2)), (x ^ 2 + y ^ 2 + 2 * (7 - x ^ 2 - y ^ 2)) =
      (147 : ℝ) / 2 * Real.pi := by sorry
  have h2 : (957 * Real.sqrt 29 - 47) / 20 * Real.pi ≠ (147 : ℝ) / 2 * Real.pi:=
    by
    --  intro h
    have h₃ : (957 * Real.sqrt 29 - 47) / 20 = (147 : ℝ) / 2:=
      by
      --  apply mul_left_cancel₀ (show (Real.pi : ℝ) ≠ 0 by exact Real.pi_ne_zero)
      --  linarith
      hole
    have h₄ : 957 * Real.sqrt 29 - 47 = 147 * 10:= by -- linarith
      linarith
    have h₅ : Real.sqrt 29 > 0 := Real.sqrt_pos.mpr (by norm_num)
    have h₆ : Real.sqrt 29 > 5:= by -- nlinarith [Real.sq_sqrt (show 0 ≤ 29 by -- norm_num)]
      hole
    have h₇ : Real.sqrt 29 < 6:= by -- nlinarith [Real.sq_sqrt (show 0 ≤ 29 by -- norm_num)]
      linarith
    --  nlinarith [Real.sq_sqrt (show 0 ≤ 29 by norm_num), Real.pi_gt_three]
    linarith
  have h3 : False:=
    by
    have h4 :
      ∫ (x : ℝ) in Set.Icc (-Real.sqrt 7) (Real.sqrt 7),
          ∫ (y : ℝ) in Set.Icc (-Real.sqrt (7 - x ^ 2)) (Real.sqrt (7 - x ^ 2)), (x ^ 2 + y ^ 2 + 2 * (7 - x ^ 2 - y ^ 2)) =
        (147 : ℝ) / 2 * Real.pi := by sorry
    have h5 : (957 * Real.sqrt 29 - 47) / 20 * Real.pi ≠ (147 : ℝ) / 2 * Real.pi:= by -- apply h2
      norm_cast
    have h6 :
      ∫ (x : ℝ) in Set.Icc (-Real.sqrt 7) (Real.sqrt 7),
          ∫ (y : ℝ) in Set.Icc (-Real.sqrt (7 - x ^ 2)) (Real.sqrt (7 - x ^ 2)), (x ^ 2 + y ^ 2 + 2 * (7 - x ^ 2 - y ^ 2)) =
        (957 * Real.sqrt 29 - 47) / 20 * Real.pi := by sorry
    have h7 : (957 * Real.sqrt 29 - 47) / 20 * Real.pi = (147 : ℝ) / 2 * Real.pi:= by -- linarith
      linarith
    have h8 : (957 * Real.sqrt 29 - 47) / 20 * Real.pi ≠ (147 : ℝ) / 2 * Real.pi:= by -- apply h2
      norm_cast
    --  exact h8 h7
    norm_cast
  --  exfalso
  --  apply h3
  norm_cast