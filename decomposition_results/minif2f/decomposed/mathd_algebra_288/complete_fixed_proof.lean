theorem mathd_algebra_288 (x y : ℝ) (n : NNReal) (h₀ : x < 0 ∧ y < 0) (h₁ : abs y = 6)
  (h₂ : Real.sqrt ((x - 8) ^ 2 + (y - 3) ^ 2) = 15) (h₃ : Real.sqrt (x ^ 2 + y ^ 2) = Real.sqrt n) : n = 52:=
  by
  have h₄ : y = -6:= by
    have h₄₁ : y < 0 := h₀.2
    have h₄₂ : abs y = 6 := h₁
    have h₄₃ : y = -6:= by
      --  rw [abs_of_neg h₄₁] at h₄₂
      --  linarith
      hole
    --  exact h₄₃
    linarith
  have h₅ : (x - 8) ^ 2 + (y - 3) ^ 2 = 225:=
    by
    have h₅₁ : Real.sqrt ((x - 8) ^ 2 + (y - 3) ^ 2) = 15 := h₂
    have h₅₂ : (x - 8) ^ 2 + (y - 3) ^ 2 = 225:=
      by
      have h₅₃ : 0 ≤ (x - 8) ^ 2 + (y - 3) ^ 2:= by -- nlinarith [sq_nonneg (x - 8), sq_nonneg (y - 3)]
        nlinarith
      have h₅₄ : Real.sqrt ((x - 8) ^ 2 + (y - 3) ^ 2) = 15 := h₂
      have h₅₅ : Real.sqrt ((x - 8) ^ 2 + (y - 3) ^ 2) ^ 2 = (15 : ℝ) ^ 2:= by -- rw [h₅₄]
        nlinarith
      have h₅₆ : (x - 8) ^ 2 + (y - 3) ^ 2 = 225:= by
        --  nlinarith [Real.sq_sqrt (show 0 ≤ (x - 8) ^ 2 + (y - 3) ^ 2 by nlinarith [sq_nonneg (x - 8), sq_nonneg (y - 3)])]
        hole
      --  exact h₅₆
      linarith
    --  exact h₅₂
    linarith
  have h₆ : x = -4:= by
    have h₆₁ : y = -6 := h₄
    --  rw [h₆₁] at h₅
    have h₆₂ : (x - 8) ^ 2 + (-6 - 3 : ℝ) ^ 2 = 225:= by -- -- ring_nf at h₅ ⊢; linarith
      linarith
    have h₆₃ : (x - 8) ^ 2 = 144:= by -- nlinarith
      linarith
    have h₆₄ : x - 8 = 12 ∨ x - 8 = -12:= by
      --  apply or_iff_not_imp_left.mpr
      --  intro h₆₅
      --  apply mul_left_cancel₀ (sub_ne_zero.mpr h₆₅)
      --  nlinarith
      hole
    --  cases h₆₄ with
    --  | inl h₆₄ =>
    --    have h₆₅ : x = 20 := by linarith
    --    have h₆₆ : x < 0 := h₀.1
    --    linarith
    --  | inr h₆₄ =>
    --    have h₆₅ : x = -4 := by linarith
    --    exact h₆₅
    nlinarith
  have h₇ : (x : ℝ) ^ 2 + (y : ℝ) ^ 2 = 52:= by
    have h₇₁ : y = -6 := h₄
    have h₇₂ : x = -4 := h₆
    --  rw [h₇₂, h₇₁]
    --  norm_num <;> linarith
    linarith
  have h₈ : (n : ℝ) = 52:= by
    have h₈₁ : Real.sqrt (x ^ 2 + y ^ 2) = Real.sqrt n := h₃
    have h₈₂ : 0 ≤ (x ^ 2 + y ^ 2 : ℝ):= by -- nlinarith [sq_nonneg x, sq_nonneg y]
      linarith
    have h₈₃ : 0 ≤ (n : ℝ):= by -- exact_mod_cast NNReal.coe_nonneg n
      norm_num
    have h₈₄ : Real.sqrt (x ^ 2 + y ^ 2) = Real.sqrt n := h₃
    have h₈₅ : (Real.sqrt (x ^ 2 + y ^ 2)) ^ 2 = (Real.sqrt n) ^ 2:= by -- rw [h₈₄]
      hole
    have h₈₆ : x ^ 2 + y ^ 2 = (n : ℝ):=
      by
      have h₈₆₁ : (Real.sqrt (x ^ 2 + y ^ 2)) ^ 2 = x ^ 2 + y ^ 2:= by
        --  --  rw [Real.sq_sqrt] <;> nlinarith [sq_nonneg x, sq_nonneg y]
        field_simp
      have h₈₆₂ : (Real.sqrt n : ℝ) ^ 2 = (n : ℝ):= by -- -- rw [Real.sq_sqrt] <;> exact_mod_cast (by positivity)
        norm_num
      --  linarith
      linarith
    have h₈₇ : (n : ℝ) = 52:= by -- linarith
      hole
    --  exact h₈₇
    hole
  have h₉ : n = 52:= by
    have h₉₁ : (n : ℝ) = 52 := h₈
    have h₉₂ : n = 52:= by
      --  --  apply_fun (fun x => (x : ℝ)) at h₉₁ <;> norm_cast at h₉₁ ⊢ <;> (try simp_all) <;> (try norm_num) <;> (try linarith)
      simpa
    --  exact h₉₂
    hole
  --  exact h₉
  simpa