theorem amc12a_2019_p12 (x y : ℝ) (h₀ : x ≠ 1 ∧ y ≠ 1) (h₁ : Real.log x / Real.log 2 = Real.log 16 / Real.log y)
  (h₂ : x * y = 64) : (Real.log (x / y) / Real.log 2) ^ 2 = 20:=
  by
  have hx_ne_zero : x ≠ 0:= by
    --  intro h
    --  rw [h] at h₂
    --  norm_num at h₂ ⊢ <;> linarith
    hole
  have hy_ne_zero : y ≠ 0:= by
    --  intro h
    --  rw [h] at h₂
    --  norm_num at h₂ ⊢ <;> linarith
    hole
  have hxy_sign : x > 0 ∧ y > 0 ∨ x < 0 ∧ y < 0:=
    by
    --  by_cases hx_pos : x > 0
    ·
      have hy_pos : y > 0:= by
        --  by_contra hy_neg
        have h₁' : y ≤ 0:= by -- linarith
          linarith
        have h₂' : x * y ≤ 0:= by -- nlinarith
          nlinarith
        --  linarith
        linarith
    --    exact Or.inl ⟨hx_pos, hy_pos⟩
    ·
      have hx_neg : x < 0:= by
        --  by_contra hx_nonneg
        have h₁' : x ≥ 0:= by -- linarith
          linarith
        have h₂' : x > 0:= by
          --  by_contra hx_nonpos
          have h₃ : x = 0:= by -- linarith
            linarith
          --  contradiction
          positivity
        --  contradiction
        linarith
      have hy_neg : y < 0:= by
        --  by_contra hy_nonneg
        have h₁' : y ≥ 0:= by -- linarith
          linarith
        have h₂' : y > 0:= by
          --  by_contra hy_nonpos
          have h₃ : y = 0:= by -- linarith
            linarith
          --  contradiction
          nlinarith
        have h₃ : x * y < 0:= by -- nlinarith
          nlinarith
        --  linarith
        linarith
    --    exact Or.inr ⟨hx_neg, hy_neg⟩
    hole
  have h_log_mul : Real.log (x * y) = Real.log 64:= by
    --  rw [h₂] <;> norm_num <;> simp_all [Real.log_mul, Real.log_pow] <;> ring_nf at * <;> norm_num at * <;> linarith
    hole
  have h_log_mul' : Real.log x + Real.log y = 6 * Real.log 2:=
    by
    have h₃ : Real.log (x * y) = Real.log x + Real.log y:=
      by
      --  by_cases hx : x = 0
      --  · exfalso
      --    exact hx_ne_zero hx
      --  · by_cases hy : y = 0
      --    · exfalso
      --      exact hy_ne_zero hy
      --    · rw [Real.log_mul (by aesop) (by aesop)]
      hole
    have h₄ : Real.log 64 = 6 * Real.log 2:=
      by
      have h₅ : Real.log 64 = Real.log (2 ^ 6):= by -- norm_num
        norm_num
      --  rw [h₅]
      have h₆ : Real.log (2 ^ 6) = 6 * Real.log 2:= by -- -- rw [Real.log_pow] <;> norm_num
        simp
      --  rw [h₆]
      linarith
    --  linarith
    linarith
  have h_log_prod : Real.log x * Real.log y = 4 * (Real.log 2) ^ 2:=
    by
    have h₃ : Real.log x / Real.log 2 = Real.log 16 / Real.log y := h₁
    have h₄ : Real.log 16 = 4 * Real.log 2:=
      by
      have h₅ : Real.log 16 = Real.log (2 ^ 4):= by -- norm_num
        norm_num
      --  rw [h₅]
      have h₆ : Real.log (2 ^ 4) = 4 * Real.log 2:= by -- -- rw [Real.log_pow] <;> norm_num
        simp
      --  rw [h₆]
      linarith
    have h₅ : y ≠ 1 := h₀.2
    have h₆ : Real.log y ≠ 0:= by
      --  intro h₇
      have h₈ : Real.log y = 0 := h₇
      have h₉ : y = 1:= by
        have h₁₀ : Real.log y = 0 := h₈
        have h₁₁ : Real.log y = Real.log (1 : ℝ):= by -- -- rw [h₁₀] <;> simp [Real.log_one]
          hole
        have h₁₂ : y = 1:= by
          --  apply
          --        Real.log_injOn_pos
          --          (Set.mem_Ioi.mpr
          --            (by
          --              by_cases h : y > 0
          --              · exact h
          --              ·
          --                have h₁₃ : y < 0 := by
          --                  by_contra h₁₄
          --                  have h₁₅ : y = 0 := by linarith
          --                  contradiction
          --                have h₁₆ : y < 0 := h₁₃
          --                exfalso
          --                simp_all [Real.log_neg_eq_log] <;> aesop))
          --          (Set.mem_Ioi.mpr (by norm_num)) <;>
          --      simp_all [Real.log_one] <;>
            aesop
          hole
        --  exact h₁₂
        linarith
      --  contradiction
      hole
    have h₇ : Real.log x / Real.log 2 = Real.log 16 / Real.log y := h₁
    have h₈ : Real.log x / Real.log 2 = (4 * Real.log 2) / Real.log y:=
      by
      --  rw [h₄] at h₇
      --  exact h₇
      hole
    have h₉ : Real.log x * Real.log y = 4 * (Real.log 2) ^ 2:=
      by
      have h₁₀ : Real.log x / Real.log 2 = (4 * Real.log 2) / Real.log y := h₈
      have h₁₁ : Real.log x * Real.log y = 4 * (Real.log 2) ^ 2:=
        by
        have h₁₂ : Real.log y ≠ 0 := h₆
        --  field_simp at h₁₀ ⊢
        --  nlinarith [Real.log_pos (by norm_num : (1 : ℝ) < 2), Real.log_pos (by norm_num : (1 : ℝ) < 2)]
        hole
      --  exact h₁₁
      linarith
    --  exact h₉
    linarith
  have h_log_sub_sq : (Real.log x - Real.log y) ^ 2 = 20 * (Real.log 2) ^ 2:=
    by
    have h₃ : (Real.log x + Real.log y) ^ 2 = (6 * Real.log 2) ^ 2:= by -- rw [h_log_mul']
      hole
    have h₄ : (Real.log x - Real.log y) ^ 2 = 20 * (Real.log 2) ^ 2:=
      by
      have h₅ : (Real.log x - Real.log y) ^ 2 = (Real.log x + Real.log y) ^ 2 - 4 * (Real.log x * Real.log y):= by -- ring
        linarith
      --  rw [h₅]
      --  rw [h₃]
      --  --  rw [h_log_prod] <;> ring_nf at * <;> nlinarith [Real.log_pos (by norm_num : (1 : ℝ) < 2)]
      linarith
    --  rw [h₄] <;> ring_nf at * <;> nlinarith [Real.log_pos (by norm_num : (1 : ℝ) < 2)]
    linarith
  have h_main : (Real.log (x / y) / Real.log 2) ^ 2 = 20:=
    by
    have h₃ : Real.log (x / y) = Real.log x - Real.log y:=
      by
      have h₄ : x / y > 0:= by
        --  cases' hxy_sign with hxy_sign hxy_sign
        ·
          have h₅ : x > 0 := hxy_sign.1
          have h₆ : y > 0 := hxy_sign.2
        --    positivity
        ·
          have h₅ : x < 0 := hxy_sign.1
          have h₆ : y < 0 := hxy_sign.2
          have h₇ : x / y > 0:= by
            have h₈ : y ≠ 0:= by -- -- -- intro h; subst h; norm_num at h₂ ⊢ <;> linarith
              linarith
            have h₉ : x / y > 0:= by
              --  apply div_pos_of_neg_of_neg
              --  · exact h₅
              --  · exact h₆
              hole
            --  exact h₉
            linarith
        --    exact h₇
        hole
      have h₅ : x ≠ 0 := hx_ne_zero
      have h₆ : y ≠ 0 := hy_ne_zero
      have h₇ : Real.log (x / y) = Real.log x - Real.log y:=
        by
        have h₈ : Real.log (x / y) = Real.log x - Real.log y:=
          by
          have h₉ : x / y > 0 := h₄
          have h₁₀ : Real.log (x / y) = Real.log x - Real.log y:= by
            --  rw [Real.log_div (by aesop) (by aesop)] <;> ring_nf <;> (try simp_all [Real.log_mul, Real.log_pow]) <;>
                    (try norm_num) <;>
                  (try linarith) <;>
                (try ring_nf at *) <;>
              (try nlinarith)
            hole
          --  exact h₁₀
          linarith
        --  exact h₈
        linarith
      --  exact h₇
      linarith
    --  rw [h₃]
    have h₄ : ((Real.log x - Real.log y) / Real.log 2) ^ 2 = 20:=
      by
      have h₅ : (Real.log x - Real.log y) ^ 2 = 20 * (Real.log 2) ^ 2 := h_log_sub_sq
      have h₆ : Real.log 2 > 0 := Real.log_pos (by norm_num)
      have h₇ : Real.log 2 ≠ 0:= by -- linarith
        norm_num
      --  calc
      --    ((Real.log x - Real.log y) / Real.log 2) ^ 2 = ((Real.log x - Real.log y) ^ 2) / (Real.log 2) ^ 2 := by
      --      field_simp [h₇] <;> ring_nf <;> field_simp [h₇] <;> ring_nf
      --    _ = (20 * (Real.log 2) ^ 2) / (Real.log 2) ^ 2 := by rw [h₅]
      --    _ = 20 := by field_simp [h₇] <;> ring_nf <;> field_simp [h₇] <;> linarith
      hole
    --  exact h₄
    hole
  --  exact h_main
  linarith