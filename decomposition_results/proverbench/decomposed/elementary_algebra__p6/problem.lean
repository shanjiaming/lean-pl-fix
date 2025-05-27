theorem cubic_inequality (ha : 0 < a) (hb : 0 < b): a^3 + b^3 ≥ a^2 * b + a * b^2 := by
  have h_main : a^3 + b^3 - (a^2 * b + a * b^2) = (a - b)^2 * (a + b) := by
    ring_nf
    <;>
    linarith [sq_nonneg (a - b), sq_nonneg (a + b), mul_pos ha hb, mul_pos (sq_pos_of_pos ha) (sq_pos_of_pos hb)]
    <;>
    nlinarith [sq_nonneg (a - b), sq_nonneg (a + b), mul_pos ha hb, mul_pos (sq_pos_of_pos ha) (sq_pos_of_pos hb)]
    <;>
    ring_nf at *
    <;>
    linarith [sq_nonneg (a - b), sq_nonneg (a + b), mul_pos ha hb, mul_pos (sq_pos_of_pos ha) (sq_pos_of_pos hb)]
  
  have h_sum_pos : 0 < a + b := by
    have h₁ : 0 < a + b := by linarith
    exact h₁
  
  have h_sq_nonneg : 0 ≤ (a - b)^2 := by
    have h₁ : 0 ≤ (a - b) ^ 2 := by
      -- Use the fact that the square of any real number is non-negative.
      nlinarith [sq_nonneg (a - b)]
    exact h₁
  
  have h_ineq : 0 ≤ a^3 + b^3 - (a^2 * b + a * b^2) := by
    have h₁ : 0 ≤ (a - b) ^ 2 * (a + b) := by
      -- Use the fact that (a - b)^2 is non-negative and a + b is positive.
      exact mul_nonneg h_sq_nonneg (le_of_lt h_sum_pos)
    have h₂ : a ^ 3 + b ^ 3 - (a ^ 2 * b + a * b ^ 2) = (a - b) ^ 2 * (a + b) := h_main
    linarith
  
  have h_final : a^3 + b^3 ≥ a^2 * b + a * b^2 := by
    have h₁ : 0 ≤ a ^ 3 + b ^ 3 - (a ^ 2 * b + a * b ^ 2) := h_ineq
    have h₂ : a ^ 3 + b ^ 3 ≥ a ^ 2 * b + a * b ^ 2 := by linarith
    exact h₂
  
  exact h_final