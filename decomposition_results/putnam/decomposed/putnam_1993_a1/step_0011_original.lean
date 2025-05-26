theorem h₃₁₄ (h₁ : 0 < 4 / 9) (h₂ : 4 / 9 < 4 * √2 / 9) (x : ℝ) (hx : x ∈ Set.Ioo 0 (√2 / 3)) (h₃₁₂ : 0 < x) (h₃₁₃ : x < √2 / 3) : 4 / 9 - (2 * x - 3 * x ^ 3) ≤ 0 :=
  by
  have h₃₁₅ : 0 < x := h₃₁₂
  have h₃₁₆ : x < (Real.sqrt 2) / 3 := h₃₁₃
  have h₃₁₇ : 0 < Real.sqrt 2 := Real.sqrt_pos.mpr (by norm_num)
  have h₃₁₈ : 0 < Real.sqrt 2 := Real.sqrt_pos.mpr (by norm_num)
  have h₃₁₉ : 0 < Real.sqrt 2 := Real.sqrt_pos.mpr (by norm_num)
  nlinarith [Real.sq_sqrt (show 0 ≤ 2 by norm_num), Real.sqrt_nonneg 2, mul_pos h₃₁₅ (pow_pos h₃₁₅ 2),
    mul_pos h₃₁₅ (pow_pos h₃₁₅ 3), mul_pos (by positivity : (0 : ℝ) < 3) (pow_pos h₃₁₅ 3),
    mul_pos (by positivity : (0 : ℝ) < 3) (pow_pos h₃₁₅ 2), mul_pos (by positivity : (0 : ℝ) < 2) (pow_pos h₃₁₅ 2),
    mul_pos (by positivity : (0 : ℝ) < 2) (pow_pos h₃₁₅ 3)]