theorem mathd_algebra_80 (x : ℝ) (h₀ : x ≠ -1) (h₁ : (x - 9) / (x + 1) = 2) : x = -11:=
  by
  have h₂ : x + 1 ≠ 0:= by
    --  intro h
    --  apply h₀
    --  linarith
    hole
  have h₃ : x - 9 = 2 * (x + 1):= by
    have h₄ : (x - 9) / (x + 1) = 2 := h₁
    have h₅ : x + 1 ≠ 0 := h₂
    --  field_simp at h₄
    --  linarith
    hole
  have h₄ : x = -11:= by
    have h₅ : x - 9 = 2 * (x + 1) := h₃
    have h₆ : x = -11:= by -- linarith
      linarith
    --  exact h₆
    linarith
  --  exact h₄
  linarith