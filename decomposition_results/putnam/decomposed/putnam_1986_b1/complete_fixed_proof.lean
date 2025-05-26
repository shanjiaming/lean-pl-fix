theorem putnam_1986_b1 (b h : ℝ) (hbh : b > 0 ∧ h > 0 ∧ b ^ 2 + h ^ 2 = 2 ^ 2) (areaeq : b * h = 0.5 * b * (1 - h / 2)) :
  h = ((2 / 5) : ℝ):=
  by
  have h₁ : h = 0.5 * (1 - h / 2):= by
    have h₂ : b > 0 := hbh.1
    have h₃ : b ≠ 0:= by -- linarith
      linarith
    have h₄ : h = 0.5 * (1 - h / 2):=
      by
      --  apply mul_left_cancel₀ (show (b : ℝ) ≠ 0 by linarith)
      --  ring_nf at areaeq ⊢
      --  nlinarith
      nlinarith
    --  exact h₄
    linarith
  have h₂ : 2 * h = 1 - h / 2:= by -- -- norm_num at h₁ ⊢ <;> linarith
    linarith
  have h₃ : 4 * h = 2 - h:=
    by
    have h₄ : 4 * h = 2 - h:= by
      have h₅ : 2 * h = 1 - h / 2 := h₂
      --  ring_nf at h₅ ⊢
      --  linarith
      linarith
    --  exact h₄
    linarith
  have h₄ : 5 * h = 2:= by
    have h₅ : 4 * h = 2 - h := h₃
    have h₆ : 5 * h = 2:= by -- linarith
      linarith
    --  exact h₆
    linarith
  have h₅ : h = (2 / 5 : ℝ):= by
    have h₆ : 5 * h = 2 := h₄
    have h₇ : h = (2 / 5 : ℝ):= by
      --  apply mul_left_cancel₀ (show (5 : ℝ) ≠ 0 by norm_num)
      --  linarith
      linarith
    --  exact h₇
    linarith
  --  exact h₅
  linarith