theorem mathd_algebra_142 (m b : ℝ) (h₀ : m * 7 + b = -1) (h₁ : m * -1 + b = 7) : m + b = 5:=
  by
  have h₂ : m = -1:=
    by
    have h₂₁ : 8 * m = -8:= by
      have h₂₂ : m * 7 + b = -1 := h₀
      have h₂₃ : m * -1 + b = 7 := h₁
      have h₂₄ : (m * 7 + b) - (m * -1 + b) = -1 - 7:= by -- linarith
        linarith
      have h₂₅ : (m * 7 + b) - (m * -1 + b) = 8 * m:= by -- ring_nf at h₂₄ ⊢ <;> linarith
        linarith
      have h₂₆ : 8 * m = -8:= by -- linarith
        linarith
      --  exact h₂₆
      linarith
    have h₂₇ : m = -1:= by -- linarith
      linarith
    --  exact h₂₇
    linarith
  have h₃ : b = 6:= by
    have h₃₁ : m = -1 := h₂
    have h₃₂ : m * -1 + b = 7 := h₁
    --  rw [h₃₁] at h₃₂
    --  linarith
    linarith
  have h₄ : m + b = 5:= by -- -- rw [h₂, h₃] <;> norm_num
    linarith
  --  exact h₄
  linarith