theorem putnam_1993_a1 :
  0 < ((4 / 9) : ℝ) ∧
    ((4 / 9) : ℝ) < (4 * Real.sqrt 2) / 9 ∧
      (∫ x in Set.Ioo 0 ((Real.sqrt 2) / 3), max (((4 / 9) : ℝ) - (2 * x - 3 * x ^ 3)) 0) =
        (∫ x in Set.Ioo 0 ((Real.sqrt 6) / 3), max ((2 * x - 3 * x ^ 3) - ((4 / 9) : ℝ)) 0):=
  by
  have h₁ : 0 < ((4 / 9) : ℝ):= by -- norm_num
    hole
  have h₂ : ((4 / 9) : ℝ) < (4 * Real.sqrt 2) / 9:=
    by
    have h₂₁ : Real.sqrt 2 > 1:= by -- norm_num [Real.lt_sqrt, Real.sqrt_lt]
      omega
    have h₂₂ : (4 : ℝ) / 9 < (4 * Real.sqrt 2) / 9:= by
      --  nlinarith [Real.sqrt_nonneg 2, Real.sq_sqrt (show 0 ≤ 2 by norm_num)]
      linarith
    --  linarith
    linarith
  have h₃ :
    (∫ x in Set.Ioo 0 ((Real.sqrt 2) / 3), max (((4 / 9) : ℝ) - (2 * x - 3 * x ^ 3)) 0) =
      (∫ x in Set.Ioo 0 ((Real.sqrt 6) / 3), max ((2 * x - 3 * x ^ 3) - ((4 / 9) : ℝ)) 0) := by sorry
  --  exact ⟨h₁, h₂, h₃⟩
  hole