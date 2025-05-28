theorem mathd_algebra_598 (a b c d : ℝ) (h₁ : (4 : ℝ) ^ a = 5) (h₂ : (5 : ℝ) ^ b = 6) (h₃ : (6 : ℝ) ^ c = 7)
  (h₄ : (7 : ℝ) ^ d = 8) : a * b * c * d = 3 / 2:=
  by
  have h₅ : a = Real.log 5 / Real.log 4:=
    by
    have h₅₁ : Real.log ((4 : ℝ) ^ a) = Real.log 5:= by -- rw [h₁]
      hole
    have h₅₂ : a * Real.log 4 = Real.log 5:=
      by
      --  rw [Real.log_rpow (by norm_num : (4 : ℝ) > 0)] at h₅₁
      --  exact h₅₁
      hole
    have h₅₃ : Real.log 4 ≠ 0:= by
      have h₅₄ : Real.log 4 > 0 := Real.log_pos (by norm_num)
      --  linarith
      hole
    have h₅₄ : a = Real.log 5 / Real.log 4:= by
      --  field_simp at h₅₂ ⊢
      --  linarith
      hole
    --  exact h₅₄
    hole
  have h₆ : b = Real.log 6 / Real.log 5:=
    by
    have h₆₁ : Real.log ((5 : ℝ) ^ b) = Real.log 6:= by -- rw [h₂]
      hole
    have h₆₂ : b * Real.log 5 = Real.log 6:=
      by
      --  rw [Real.log_rpow (by norm_num : (5 : ℝ) > 0)] at h₆₁
      --  exact h₆₁
      hole
    have h₆₃ : Real.log 5 ≠ 0:= by
      have h₆₄ : Real.log 5 > 0 := Real.log_pos (by norm_num)
      --  linarith
      hole
    have h₆₄ : b = Real.log 6 / Real.log 5:= by
      --  field_simp at h₆₂ ⊢
      --  linarith
      hole
    --  exact h₆₄
    hole
  have h₇ : c = Real.log 7 / Real.log 6:=
    by
    have h₇₁ : Real.log ((6 : ℝ) ^ c) = Real.log 7:= by -- rw [h₃]
      hole
    have h₇₂ : c * Real.log 6 = Real.log 7:=
      by
      --  rw [Real.log_rpow (by norm_num : (6 : ℝ) > 0)] at h₇₁
      --  exact h₇₁
      hole
    have h₇₃ : Real.log 6 ≠ 0:= by
      have h₇₄ : Real.log 6 > 0 := Real.log_pos (by norm_num)
      --  linarith
      hole
    have h₇₄ : c = Real.log 7 / Real.log 6:= by
      --  field_simp at h₇₂ ⊢
      --  linarith
      hole
    --  exact h₇₄
    hole
  have h₈ : d = Real.log 8 / Real.log 7:=
    by
    have h₈₁ : Real.log ((7 : ℝ) ^ d) = Real.log 8:= by -- rw [h₄]
      hole
    have h₈₂ : d * Real.log 7 = Real.log 8:=
      by
      --  rw [Real.log_rpow (by norm_num : (7 : ℝ) > 0)] at h₈₁
      --  exact h₈₁
      hole
    have h₈₃ : Real.log 7 ≠ 0:= by
      have h₈₄ : Real.log 7 > 0 := Real.log_pos (by norm_num)
      --  linarith
      hole
    have h₈₄ : d = Real.log 8 / Real.log 7:= by
      --  field_simp at h₈₂ ⊢
      --  linarith
      hole
    --  exact h₈₄
    hole
  have h₉ : a * b * c * d = (Real.log 8) / (Real.log 4):=
    by
    --  rw [h₅, h₆, h₇, h₈]
    have h₉₁ : Real.log 5 > 0 := Real.log_pos (by norm_num)
    have h₉₁ : Real.log 6 > 0 := Real.log_pos (by norm_num)
    have h₁₀₁ : Real.log 7 > 0 := Real.log_pos (by norm_num)
    have h₁₁₁ : Real.log 4 > 0 := Real.log_pos (by norm_num)
    have h₁₂₁ : Real.log 8 > 0 := Real.log_pos (by norm_num)
    --  --  field_simp [Real.log_mul, Real.log_div, Real.log_rpow, Real.log_pow] <;> ring_nf <;>
                field_simp [Real.log_mul, Real.log_div, Real.log_rpow, Real.log_pow] <;>
              ring_nf <;>
            field_simp [Real.log_mul, Real.log_div, Real.log_rpow, Real.log_pow] <;>
          ring_nf <;>
        field_simp [Real.log_mul, Real.log_div, Real.log_rpow, Real.log_pow] <;>
      linarith
    hole
  have h₁₀ : Real.log 8 = 3 * Real.log 2:=
    by
    have h₁₀₁ : Real.log 8 = Real.log (2 ^ 3):= by -- norm_num
      hole
    --  rw [h₁₀₁]
    have h₁₀₂ : Real.log (2 ^ 3) = 3 * Real.log 2:= by -- -- rw [Real.log_pow] <;> norm_num
      hole
    --  rw [h₁₀₂] <;> norm_num
    hole
  have h₁₁ : Real.log 4 = 2 * Real.log 2:=
    by
    have h₁₁₁ : Real.log 4 = Real.log (2 ^ 2):= by -- norm_num
      hole
    --  rw [h₁₁₁]
    have h₁₁₂ : Real.log (2 ^ 2) = 2 * Real.log 2:= by -- -- rw [Real.log_pow] <;> norm_num
      hole
    --  rw [h₁₁₂] <;> norm_num
    hole
  have h₁₂ : a * b * c * d = 3 / 2:= by
    --  rw [h₉]
    have h₁₂₁ : Real.log 8 = 3 * Real.log 2 := h₁₀
    have h₁₂₂ : Real.log 4 = 2 * Real.log 2 := h₁₁
    --  rw [h₁₂₁, h₁₂₂]
    have h₁₂₃ : Real.log 2 ≠ 0:= by
      have h₁₂₄ : Real.log 2 > 0 := Real.log_pos (by norm_num)
      --  linarith
      hole
    --  --  field_simp [h₁₂₃] <;> ring_nf <;> field_simp [h₁₂₃] <;> linarith
    hole
  --  rw [h₁₂] <;> norm_num
  hole