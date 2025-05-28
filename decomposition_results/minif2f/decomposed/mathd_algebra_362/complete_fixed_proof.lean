theorem mathd_algebra_362 (a b : ℝ) (h₀ : a ^ 2 * b ^ 3 = 32 / 27) (h₁ : a / b ^ 3 = 27 / 4) : a + b = 8 / 3:=
  by
  have hb3 : b ≠ 0:= by
    --  by_contra h
    have h₂ : b = 0:= by -- simpa using h
      linarith
    --  rw [h₂] at h₁
    --  norm_num at h₁ ⊢ <;> simp_all [pow_three] <;> ring_nf at * <;> norm_num at * <;> linarith
    hole
  have a_eq : a = (27 / 4 : ℝ) * b ^ 3:= by
    have h₂ : b ^ 3 ≠ 0:= by -- positivity
      nlinarith
    have h₃ : a = (27 / 4 : ℝ) * b ^ 3:= by
      have h₄ : a / b ^ 3 = 27 / 4 := h₁
      have h₅ : a = (27 / 4 : ℝ) * b ^ 3:= by
        --  --  field_simp at h₄ ⊢ <;> nlinarith [sq_pos_of_ne_zero hb3, sq_pos_of_ne_zero (pow_ne_zero 3 hb3)]
        hole
      --  exact h₅
      linarith
    --  exact h₃
    linarith
  have b9_eq : b ^ 9 = (2 / 3 : ℝ) ^ 9:=
    by
    have h₂ : a = (27 / 4 : ℝ) * b ^ 3 := a_eq
    --  rw [h₂] at h₀
    have h₃ : ((27 / 4 : ℝ) * b ^ 3) ^ 2 * b ^ 3 = 32 / 27:= by -- linarith
      linarith
    have h₄ : b ^ 9 = (2 / 3 : ℝ) ^ 9:= by
      --  ring_nf at h₃ ⊢ <;>
      --    nlinarith [sq_pos_of_ne_zero hb3, sq_pos_of_ne_zero (pow_ne_zero 3 hb3), sq_pos_of_ne_zero (pow_ne_zero 2 hb3),
      --      sq_pos_of_ne_zero (pow_ne_zero 5 hb3), sq_pos_of_ne_zero (pow_ne_zero 6 hb3),
      --      sq_pos_of_ne_zero (pow_ne_zero 7 hb3), sq_pos_of_ne_zero (pow_ne_zero 8 hb3),
      --      sq_pos_of_ne_zero (pow_ne_zero 9 hb3)]
      linarith
    --  exact h₄
    linarith
  have b_eq : b = 2 / 3:= by
    have h₂ : b ^ 9 = (2 / 3 : ℝ) ^ 9 := b9_eq
    have h₃ : b = 2 / 3:=
      by
      have h₄ : b > 0 ∨ b < 0:= by
        --  by_cases h₅ : b > 0
        --  · exact Or.inl h₅
        ·
          have h₆ : b < 0:= by
            --  by_contra h₇
            have h₈ : b ≥ 0:= by -- linarith
              linarith
            have h₉ : b = 0:= by
              --  by_contra h₁₀
              have h₁₁ : b > 0:= by
                --  by_cases h₁₂ : b > 0
                --  · exact h₁₂
                --  · exfalso
                  have h₁₃ : b < 0:= by
                    --  by_contra h₁₄
                    have h₁₅ : b ≥ 0:= by -- linarith
                      linarith
                    have h₁₆ : b ≠ 0:= by -- tauto
                      simpa
                    have h₁₇ : b > 0:= by
                      --  apply lt_of_le_of_ne
                      --  · linarith
                      --  · intro h₁₈
                      --    apply h₁₆
                      --    linarith
                      positivity
                    --  linarith
                    linarith
                --    linarith
                hole
              have h₁₂ : b > 0:= by -- tauto
                linarith
              have h₁₃ : a = (27 / 4 : ℝ) * b ^ 3 := a_eq
              have h₁₄ : a ^ 2 * b ^ 3 = 32 / 27 := h₀
              have h₁₅ : a / b ^ 3 = 27 / 4 := h₁
              --  nlinarith [sq_pos_of_pos h₁₁, pow_pos h₁₁ 2, pow_pos h₁₁ 3, pow_pos h₁₁ 4, pow_pos h₁₁ 5, pow_pos h₁₁ 6,
              --    pow_pos h₁₁ 7, pow_pos h₁₁ 8, pow_pos h₁₁ 9]
              linarith
            --  simp_all
            norm_cast
        --    exact Or.inr h₆
        hole
      --  cases h₄ with
      --  | inl h₄ =>
      --    have h₅ : b > 0 := h₄
      --    have h₆ : b = 2 / 3 := by
      --      have h₇ : b ^ 9 = (2 / 3 : ℝ) ^ 9 := h₂
      --      have h₈ : b = 2 / 3 := by
      --        apply le_antisymm
      --        · by_contra h₉
      --          have h₁₀ : b > 2 / 3 := by
      --            by_cases h₁₁ : b > 2 / 3
      --            · exact h₁₁
      --            · exfalso
      --              have h₁₂ : b ≤ 2 / 3 := by linarith
      --              have h₁₃ : b ^ 9 ≤ (2 / 3 : ℝ) ^ 9 := by exact pow_le_pow_of_le_left (by positivity) h₁₂ 9
      --              linarith
      --          have h₁₁ : b ^ 9 > (2 / 3 : ℝ) ^ 9 := by exact pow_lt_pow_of_lt_left h₁₀ (by positivity) (by norm_num)
      --          linarith
      --        · by_contra h₉
      --          have h₁₀ : b < 2 / 3 := by
      --            by_cases h₁₁ : b < 2 / 3
      --            · exact h₁₁
      --            · exfalso
      --              have h₁₂ : b ≥ 2 / 3 := by linarith
      --              have h₁₃ : b ^ 9 ≥ (2 / 3 : ℝ) ^ 9 := by exact pow_le_pow_of_le_left (by positivity) h₁₂ 9
      --              linarith
      --          have h₁₁ : b ^ 9 < (2 / 3 : ℝ) ^ 9 := by exact pow_lt_pow_of_lt_left h₁₀ (by positivity) (by norm_num)
      --          linarith
      --      exact h₈
      --    exact h₆
      --  | inr h₄ =>
      --    have h₅ : b < 0 := h₄
      --    have h₆ : b ^ 9 < 0 :=
      --      by
      --      have h₇ : b ^ 9 < 0 := by
      --        exact by
      --          have h₈ : b < 0 := h₅
      --          have h₉ : b ^ 9 < 0 :=
      --            by
      --            have h₁₀ : b ^ 9 < 0 := by
      --              have h₁₁ : b < 0 := h₈
      --              have h₁₂ : b ^ 9 < 0 := by
      --                have h₁₃ : b ^ 2 > 0 := by nlinarith
      --                have h₁₄ : b ^ 3 < 0 := by nlinarith
      --                have h₁₅ : b ^ 4 > 0 := by nlinarith
      --                have h₁₆ : b ^ 5 < 0 := by nlinarith
      --                have h₁₇ : b ^ 6 > 0 := by nlinarith
      --                have h₁₈ : b ^ 7 < 0 := by nlinarith
      --                have h₁₉ : b ^ 8 > 0 := by nlinarith
      --                have h₂₀ : b ^ 9 < 0 := by nlinarith
      --                exact h₂₀
      --              exact h₁₂
      --            exact h₁₀
      --          exact h₉ <;> simp_all
      --      exact h₇
      --    have h₇ : (2 / 3 : ℝ) ^ 9 > 0 := by positivity
      --    linarith
      hole
    --  exact h₃
    linarith
  have a_eq₂ : a = 2:= by
    --  rw [a_eq]
    --  --  rw [b_eq] <;> norm_num <;> ring_nf at * <;> norm_num at * <;> linarith
    hole
  have h₂ : a + b = 8 / 3:= by -- -- rw [a_eq₂, b_eq] <;> norm_num
    linarith
  --  exact h₂
  linarith