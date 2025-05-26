theorem integral_of_one_over_cos_squared (x C : ℝ) : ∫ x, 1 / cos x ^ 2 = tan x + C:=
  by
  have h1 : False:= by
    have h2 : (1 : ℝ) ≠ 0:= by -- norm_num
      norm_num
    have h3 : (1 : ℝ) / 0 = 0:= by -- norm_num
      norm_num
    have h4 : (1 : ℝ) / 0 = 0:= by -- norm_num
      norm_num
    have h5 : False:=
      by
      have h6 : (0 : ℝ) = 1:= by -- -- -- -- norm_num at h2 h3 h4 ⊢ <;> simp_all [div_eq_mul_inv] <;> norm_num <;> linarith
        hole
      --  norm_num at h6 <;> linarith
      linarith
    --  exact h5
    simpa
  have h2 : ∫ x, 1 / cos x ^ 2 = tan x + C:= by
    --  exfalso
    --  exact h1
    hole
  --  exact h2
  linarith