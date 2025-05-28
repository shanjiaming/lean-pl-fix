theorem mathd_algebra_756 (a b : ℝ) (h₀ : (2 : ℝ) ^ a = 32) (h₁ : a ^ b = 125) : b ^ a = 243:=
  by
  have h₂ : a > 0:= by
    --  by_contra h
    have h₂₁ : a ≤ 0:= by -- linarith
      hole
    have h₂₂ : (2 : ℝ) ^ a ≤ 1:= by
      have h₂₂₁ : a ≤ 0 := h₂₁
      have h₂₂₂ : (2 : ℝ) ^ a ≤ (2 : ℝ) ^ (0 : ℝ):=
        by
        --  apply Real.rpow_le_rpow_of_exponent_le
        · norm_num
        · linarith
        hole
      --  --  norm_num at h₂₂₂ ⊢ <;> linarith
      hole
    have h₂₃ : (2 : ℝ) ^ a = 32 := h₀
    linarith
    hole
  have h₃ : a = 5:= by
    have h₄ : Real.log ((2 : ℝ) ^ a) = Real.log (32 : ℝ):= by -- rw [h₀]
      hole
    have h₅ : a * Real.log 2 = Real.log 32:= by
      --  --  rw [Real.log_rpow (by norm_num : (2 : ℝ) > 0)] at h₄ <;> simp_all [Real.log_pow] <;> ring_nf at * <;> linarith
      hole
    have h₆ : Real.log 32 = 5 * Real.log 2:=
      by
      have h₆₁ : Real.log 32 = Real.log (2 ^ 5):= by -- norm_num
        hole
      --  rw [h₆₁]
      have h₆₂ : Real.log (2 ^ 5 : ℝ) = 5 * Real.log 2:= by -- -- rw [Real.log_pow] <;> norm_num <;> linarith
        hole
      --  rw [h₆₂]
      hole
    --  rw [h₆] at h₅
    have h₇ : a * Real.log 2 = 5 * Real.log 2:= by -- linarith
      hole
    have h₈ : a = 5:=
      by
      --  apply
      --    mul_left_cancel₀
      --      (show (Real.log 2 : ℝ) ≠ 0 by
      --        have h₉ : Real.log 2 > 0 := Real.log_pos (by norm_num)
      --        linarith)
      --  linarith
      hole
    --  exact h₈
    hole
  have h₄ : b = 3:= by
    have h₅ : a > 0 := h₂
    have h₆ : a = 5 := h₃
    have h₇ : (a : ℝ) ^ b = 125 := h₁
    --  rw [h₆] at h₇
    have h₈ : (5 : ℝ) ^ b = 125:= by -- exact_mod_cast h₇
      hole
    have h₉ : Real.log ((5 : ℝ) ^ b) = Real.log 125:= by -- rw [h₈]
      hole
    have h₁₀ : b * Real.log 5 = Real.log 125:=
      by
      have h₁₀₁ : Real.log ((5 : ℝ) ^ b) = b * Real.log 5:= by -- rw [Real.log_rpow (by norm_num : (5 : ℝ) > 0)]
        hole
      --  rw [h₁₀₁] at h₉
      --  linarith
      hole
    have h₁₁ : Real.log 125 = Real.log (5 ^ 3):= by -- norm_num
      hole
    have h₁₂ : Real.log (5 ^ 3 : ℝ) = 3 * Real.log 5:= by -- -- rw [Real.log_pow] <;> norm_num <;> linarith
      hole
    have h₁₃ : Real.log 125 = 3 * Real.log 5:= by -- rw [h₁₁, h₁₂]
      hole
    --  rw [h₁₃] at h₁₀
    have h₁₄ : b * Real.log 5 = 3 * Real.log 5:= by -- linarith
      hole
    have h₁₅ : b = 3:=
      by
      --  apply
      --    mul_left_cancel₀
      --      (show (Real.log 5 : ℝ) ≠ 0 by
      --        have h₁₅₁ : Real.log 5 > 0 := Real.log_pos (by norm_num)
      --        linarith)
      --  linarith
      hole
    --  exact h₁₅
    hole
  have h₅ : b ^ a = 243:= by
    --  rw [h₄, h₃]
    have h₅₁ : (3 : ℝ) ^ (5 : ℝ) = 243:= by
      --  norm_num [Real.rpow_def_of_pos, Real.rpow_def_of_nonneg, Real.log_pow] <;> ring_nf <;> norm_num <;> linarith
      hole
    --  rw [h₅₁] <;> norm_num
    hole
  --  exact h₅
  hole