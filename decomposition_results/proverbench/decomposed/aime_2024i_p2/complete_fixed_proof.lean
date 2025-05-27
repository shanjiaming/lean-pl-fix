theorem aime_2024i_p2 (x y : ℝ) (hx : 1 < x) (hy : 1 < y) (h₁ : Real.logb x (y ^ x) = 10)
  (h₂ : Real.logb y (x ^ (4 * y)) = 10) : x * y = 25:=
  by
  have h₃ : x > 0:= by -- linarith
    linarith
  have h₄ : y > 0:= by -- linarith
    linarith
  have h₅ : Real.log x > 0 := Real.log_pos (by linarith)
  have h₆ : Real.log y > 0 := Real.log_pos (by linarith)
  have h₇ : x * Real.log y = 10 * Real.log x:=
    by
    have h₇₁ : Real.logb x (y ^ x) = (x * Real.log y) / Real.log x:= by
      --  rw [Real.logb, Real.log_pow, Real.log_pow] <;>
              field_simp [Real.log_mul, Real.log_rpow, h₃.ne', h₄.ne',
                Real.log_ne_zero_of_pos_of_ne_one (by linarith : 0 < x) (by linarith : x ≠ 1),
                Real.log_ne_zero_of_pos_of_ne_one (by linarith : 0 < y) (by linarith : y ≠ 1)] <;>
            ring <;>
          field_simp [Real.log_mul, Real.log_rpow, h₃.ne', h₄.ne',
            Real.log_ne_zero_of_pos_of_ne_one (by linarith : 0 < x) (by linarith : x ≠ 1),
            Real.log_ne_zero_of_pos_of_ne_one (by linarith : 0 < y) (by linarith : y ≠ 1)] <;>
        ring
      hole
    --  rw [h₇₁] at h₁
    have h₇₂ : (x * Real.log y) / Real.log x = 10:= by -- linarith
      linarith
    have h₇₃ : x * Real.log y = 10 * Real.log x:= by
      --  --  field_simp [Real.log_ne_zero_of_pos_of_ne_one (by linarith : 0 < x) (by linarith : x ≠ 1)] at h₇₂ ⊢ <;> nlinarith
      hole
    --  exact h₇₃
    linarith
  have h₈ : 4 * y * Real.log x = 10 * Real.log y:=
    by
    have h₈₁ : Real.logb y (x ^ (4 * y)) = (4 * y * Real.log x) / Real.log y:=
      by
      have h₈₂ : Real.logb y (x ^ (4 * y)) = Real.log (x ^ (4 * y)) / Real.log y:= by -- rw [Real.logb]
        norm_cast
      --  rw [h₈₂]
      have h₈₃ : Real.log (x ^ (4 * y)) = (4 * y) * Real.log x:= by -- rw [Real.log_rpow (by linarith)] <;> ring
        hole
      --  rw [h₈₃] <;> field_simp [Real.log_ne_zero_of_pos_of_ne_one (by linarith : 0 < y) (by linarith : y ≠ 1)] <;> ring <;>
          field_simp [Real.log_ne_zero_of_pos_of_ne_one (by linarith : 0 < y) (by linarith : y ≠ 1)] <;>
        ring
      hole
    --  rw [h₈₁] at h₂
    have h₈₄ : (4 * y * Real.log x) / Real.log y = 10:= by -- linarith
      linarith
    have h₈₅ : 4 * y * Real.log x = 10 * Real.log y:=
      by
      have h₈₆ : Real.log y ≠ 0:= by -- exact Real.log_ne_zero_of_pos_of_ne_one (by linarith) (by linarith)
        linarith
      --  --  field_simp [h₈₆] at h₈₄ ⊢ <;> nlinarith
      hole
    --  exact h₈₅
    linarith
  have h₉ : x * y = 25:= by
    have h₉₁ : 4 * y * Real.log x = 10 * Real.log y := h₈
    have h₉₂ : x * Real.log y = 10 * Real.log x := h₇
    have h₉₃ : Real.log y > 0 := h₆
    have h₉₄ : Real.log x > 0 := h₅
    have h₉₅ : x > 0 := h₃
    have h₉₆ : y > 0 := h₄
    have h₉₇ : 4 * y = 100 / x:= by
      have h₉₇₁ : 4 * y * Real.log x = 10 * Real.log y := h₈
      have h₉₇₂ : x * Real.log y = 10 * Real.log x := h₇
      have h₉₇₃ : Real.log y = (10 * Real.log x) / x:=
        by
        have h₉₇₄ : x * Real.log y = 10 * Real.log x := h₇
        have h₉₇₅ : Real.log y = (10 * Real.log x) / x:=
          by
          have h₉₇₆ : x ≠ 0:= by -- linarith
            linarith
          --  --  field_simp at h₉₇₄ ⊢ <;> nlinarith
          hole
        --  exact h₉₇₅
        linarith
      have h₉₇₇ : 4 * y * Real.log x = 10 * Real.log y := h₈
      have h₉₇₈ : 4 * y * Real.log x = 10 * ((10 * Real.log x) / x):= by -- -- rw [h₉₇₃] at h₉₇₇ <;> linarith
        linarith
      have h₉₇₉ : 4 * y * Real.log x = (100 * Real.log x) / x:=
        by
        have h₉₇₁₀ : 4 * y * Real.log x = 10 * ((10 * Real.log x) / x) := h₉₇₈
        --  calc
        --    4 * y * Real.log x = 10 * ((10 * Real.log x) / x) := h₉₇₁₀
        --    _ = (100 * Real.log x) / x := by field_simp [h₉₅.ne'] <;> ring <;> field_simp [h₉₅.ne'] <;> ring
        --    _ = (100 * Real.log x) / x := by rfl
        hole
      have h₉₈₀ : 4 * y = 100 / x:=
        by
        have h₉₈₁ : 4 * y * Real.log x = (100 * Real.log x) / x := h₉₇₉
        have h₉₈₂ : x ≠ 0:= by -- linarith
          linarith
        have h₉₈₃ : Real.log x ≠ 0:= by
          have h₉₈₄ : Real.log x > 0 := h₉₄
          --  linarith
          linarith
        --  --  field_simp at h₉₈₁ ⊢ <;> nlinarith
        hole
      --  exact h₉₈₀
      linarith
    have h₉₈ : x * y = 25:= by
      have h₉₈₁ : 4 * y = 100 / x := h₉₇
      have h₉₈₂ : x * y = 25:= by
        have h₉₈₃ : 4 * y = 100 / x := h₉₇
        have h₉₈₄ : x > 0 := h₃
        have h₉₈₅ : y > 0 := h₄
        have h₉₈₆ : x ≠ 0:= by -- linarith
          linarith
        have h₉₈₇ : y = (100 / x) / 4:= by
          have h₉₈₈ : 4 * y = 100 / x := h₉₇
          --  --  --  field_simp at h₉₈₈ ⊢ <;> ring_nf at h₉₈₈ ⊢ <;> nlinarith
          linarith
        --  rw [h₉₈₇]
        --  --  field_simp <;> ring_nf <;> field_simp [h₉₈₆] <;> nlinarith
        nlinarith
      --  exact h₉₈₂
      linarith
    --  exact h₉₈
    linarith
  --  exact h₉
  linarith