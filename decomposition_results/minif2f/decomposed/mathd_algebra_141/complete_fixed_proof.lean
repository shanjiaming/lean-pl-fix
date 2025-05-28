theorem mathd_algebra_141 (a b : ℝ) (h₁ : a * b = 180) (h₂ : 2 * (a + b) = 54) : a ^ 2 + b ^ 2 = 369:=
  by
  have h₃ : a + b = 27:= by
    have h₃₁ : a + b = 27:= by -- linarith
      linarith
    --  exact h₃₁
    linarith
  have h₄ : (a + b) ^ 2 = 729:= by
    --  rw [h₃]
    --  norm_num <;> linarith
    nlinarith
  have h₅ : a ^ 2 + b ^ 2 + 2 * (a * b) = 729:=
    by
    have h₅₁ : (a + b) ^ 2 = a ^ 2 + b ^ 2 + 2 * (a * b):= by -- ring
      linarith
    --  rw [h₄] at h₅₁
    --  linarith
    linarith
  have h₆ : a ^ 2 + b ^ 2 + 2 * 180 = 729:=
    by
    have h₆₁ : a ^ 2 + b ^ 2 + 2 * (a * b) = 729 := h₅
    have h₆₂ : a * b = 180 := h₁
    have h₆₃ : a ^ 2 + b ^ 2 + 2 * 180 = 729:= by
      --  calc
      --    a ^ 2 + b ^ 2 + 2 * 180 = a ^ 2 + b ^ 2 + 2 * (a * b) := by rw [h₆₂]
      --    _ = 729 := by linarith
      --    _ = 729 := by ring
      linarith
    --  exact h₆₃
    linarith
  have h₇ : a ^ 2 + b ^ 2 = 369:= by
    have h₇₁ : a ^ 2 + b ^ 2 + 2 * 180 = 729 := h₆
    have h₇₂ : a ^ 2 + b ^ 2 = 369:= by -- linarith
      linarith
    --  exact h₇₂
    linarith
  --  exact h₇
  linarith