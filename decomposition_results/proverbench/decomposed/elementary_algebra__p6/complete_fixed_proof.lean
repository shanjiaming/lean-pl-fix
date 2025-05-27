theorem cubic_inequality (ha : 0 < a) (hb : 0 < b) : a ^ 3 + b ^ 3 ≥ a ^ 2 * b + a * b ^ 2:=
  by
  have h_main : a ^ 3 + b ^ 3 - (a ^ 2 * b + a * b ^ 2) = (a - b) ^ 2 * (a + b):= by
    --  ring_nf <;>
            linarith [sq_nonneg (a - b), sq_nonneg (a + b), mul_pos ha hb,
              mul_pos (sq_pos_of_pos ha) (sq_pos_of_pos hb)] <;>
          nlinarith [sq_nonneg (a - b), sq_nonneg (a + b), mul_pos ha hb,
            mul_pos (sq_pos_of_pos ha) (sq_pos_of_pos hb)] <;>
        ring_nf at * <;>
      linarith [sq_nonneg (a - b), sq_nonneg (a + b), mul_pos ha hb, mul_pos (sq_pos_of_pos ha) (sq_pos_of_pos hb)]
    hole
  have h_sum_pos : 0 < a + b:= by
    have h₁ : 0 < a + b:= by -- linarith
      linarith
    --  exact h₁
    linarith
  have h_sq_nonneg : 0 ≤ (a - b) ^ 2:=
    by
    have h₁ : 0 ≤ (a - b) ^ 2:= by -- nlinarith [sq_nonneg (a - b)]
      nlinarith
    --  exact h₁
    linarith
  have h_ineq : 0 ≤ a ^ 3 + b ^ 3 - (a ^ 2 * b + a * b ^ 2):=
    by
    have h₁ : 0 ≤ (a - b) ^ 2 * (a + b):= by -- exact mul_nonneg h_sq_nonneg (le_of_lt h_sum_pos)
      nlinarith
    have h₂ : a ^ 3 + b ^ 3 - (a ^ 2 * b + a * b ^ 2) = (a - b) ^ 2 * (a + b) := h_main
    --  linarith
    linarith
  have h_final : a ^ 3 + b ^ 3 ≥ a ^ 2 * b + a * b ^ 2:=
    by
    have h₁ : 0 ≤ a ^ 3 + b ^ 3 - (a ^ 2 * b + a * b ^ 2) := h_ineq
    have h₂ : a ^ 3 + b ^ 3 ≥ a ^ 2 * b + a * b ^ 2:= by -- linarith
      linarith
    --  exact h₂
    linarith
  --  exact h_final
  linarith