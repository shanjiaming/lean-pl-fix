theorem mathd_algebra_332 (x y : ℝ) (h₀ : (x + y) / 2 = 7) (h₁ : Real.sqrt (x * y) = Real.sqrt 19) : x ^ 2 + y ^ 2 = 158:=
  by
  have h₂ : x + y = 14:= by
    have h₂₁ : (x + y) / 2 = 7 := h₀
    have h₂₂ : x + y = 14:= by -- linarith
      linarith
    --  exact h₂₂
    linarith
  have h₃ : x * y = 19:= by
    have h₃₁ : Real.sqrt (x * y) = Real.sqrt 19 := h₁
    have h₃₂ : x * y ≥ 0:= by
      --  by_contra h
      have h₃₃ : x * y < 0:= by -- linarith
        linarith
      have h₃₄ : Real.sqrt (x * y) = 0:= by -- -- rw [Real.sqrt_eq_zero_of_nonpos] <;> linarith
        hole
      --  rw [h₃₄] at h₃₁
      have h₃₅ : Real.sqrt 19 > 0 := Real.sqrt_pos.mpr (by norm_num)
      have h₃₆ : (0 : ℝ) < Real.sqrt 19:= by -- positivity
        norm_num
      --  --  norm_num at h₃₁ ⊢ <;> linarith
      linarith
    have h₃₃ : x * y = 19:= by
      have h₃₄ : Real.sqrt (x * y) = Real.sqrt 19 := h₁
      have h₃₅ : Real.sqrt (x * y) = Real.sqrt 19 := h₁
      have h₃₆ : Real.sqrt (x * y) ^ 2 = Real.sqrt 19 ^ 2:= by -- rw [h₃₅]
        hole
      have h₃₇ : x * y = 19:= by
        --  nlinarith [Real.sq_sqrt (show 0 ≤ x * y by linarith), Real.sq_sqrt (show 0 ≤ (19 : ℝ) by norm_num)]
        hole
      --  exact h₃₇
      linarith
    --  exact h₃₃
    linarith
  have h₄ : x ^ 2 + y ^ 2 = 158:=
    by
    have h₄₁ : x ^ 2 + y ^ 2 = (x + y) ^ 2 - 2 * (x * y):= by -- ring
      linarith
    --  rw [h₄₁]
    --  --  rw [h₂, h₃] <;> norm_num <;> linarith
    nlinarith
  --  exact h₄
  linarith