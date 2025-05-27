theorem product_of_positive_reals_bound (a b c : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c)
  (h_sum : (a ^ 2 / (1 + a ^ 2)) + (b ^ 2 / (1 + b ^ 2)) + (c ^ 2 / (1 + c ^ 2)) = 1) :
  abs (a * b * c) ≤ 1 / (2 * Real.sqrt 2):=
  by
  have h₁ : a * b * c ≤ 1 / (2 * Real.sqrt 2):=
    by
    have h₁₁ : 0 < a * b * c:= by -- positivity
      positivity
    have h₁₂ : 0 < a * b:= by -- positivity
      nlinarith
    have h₁₃ : 0 < a * c:= by -- positivity
      nlinarith
    have h₁₄ : 0 < b * c:= by -- positivity
      nlinarith
    have h₁₅ : 0 < Real.sqrt 2 := Real.sqrt_pos.mpr (by norm_num)
    have h₁₆ : (a ^ 2 / (1 + a ^ 2) + b ^ 2 / (1 + b ^ 2) + c ^ 2 / (1 + c ^ 2)) = 1 := h_sum
    have h₁₇ : a ^ 2 * b ^ 2 * c ^ 2 ≤ 1 / 8:=
      by
      have h₁₇₁ : 0 < 1 + a ^ 2:= by -- positivity
        nlinarith
      have h₁₇₂ : 0 < 1 + b ^ 2:= by -- positivity
        nlinarith
      have h₁₇₃ : 0 < 1 + c ^ 2:= by -- positivity
        nlinarith
      have h₁₇₄ : 0 < (1 + a ^ 2) * (1 + b ^ 2) * (1 + c ^ 2):= by -- positivity
        nlinarith
      --  field_simp at h₁₆
      --  nlinarith [sq_nonneg (a ^ 2 - b ^ 2), sq_nonneg (b ^ 2 - c ^ 2), sq_nonneg (c ^ 2 - a ^ 2), sq_nonneg (a ^ 2 - 1 / 2),
      --    sq_nonneg (b ^ 2 - 1 / 2), sq_nonneg (c ^ 2 - 1 / 2)]
      hole
    have h₁₈ : a * b * c ≤ 1 / (2 * Real.sqrt 2):=
      by
      have h₁₈₁ : 0 < Real.sqrt 2 := Real.sqrt_pos.mpr (by norm_num)
      have h₁₈₂ : (a * b * c) ^ 2 ≤ 1 / 8:= by -- nlinarith [sq_nonneg (a * b * c), h₁₇]
        linarith
      have h₁₈₃ : a * b * c ≤ 1 / (2 * Real.sqrt 2) :=
        by
        have h₁₈₄ : 0 < 2 * Real.sqrt 2 := by positivity
        have h₁₈₅ : 0 < 1 / (2 * Real.sqrt 2) := by positivity
        have h₁₈₆ : (a * b * c) ^ 2 ≤ (1 / (2 * Real.sqrt 2)) ^ 2 := by
          calc
            (a * b * c) ^ 2 ≤ 1 / 8 := h₁₈₂
            _ = (1 / (2 * Real.sqrt 2)) ^ 2 := by
              field_simp [Real.sqrt_eq_iff_sq_eq, pow_two, mul_assoc] <;> ring_nf <;> field_simp <;> ring_nf <;>
                  norm_num <;>
                linarith [Real.sq_sqrt (show 0 ≤ 2 by norm_num)]
            _ = (1 / (2 * Real.sqrt 2)) ^ 2 := by rfl
        nlinarith [sq_nonneg (a * b * c - 1 / (2 * Real.sqrt 2))]
      --  exact h₁₈₃
      hole
    --  exact h₁₈
    linarith
  have h₂ : 0 ≤ a * b * c := by
    have h₃ : 0 < a * b * c := by positivity
    linarith
  have h₃ : abs (a * b * c) ≤ 1 / (2 * Real.sqrt 2) :=
    by
    have h₄ : a * b * c ≤ 1 / (2 * Real.sqrt 2) := h₁
    have h₅ : 0 ≤ a * b * c := h₂
    rw [abs_of_nonneg h₅] <;> linarith
  --  exact h₃
  linarith