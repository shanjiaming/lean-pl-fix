theorem cubic_inequality (a b : ℝ) (ha : 0 < a) (hb : 0 < b) : a ^ 3 + b ^ 3 ≥ a ^ 2 * b + a * b ^ 2 :=
  by
  have h_main : a ^ 3 + b ^ 3 - (a ^ 2 * b + a * b ^ 2) = (a - b) ^ 2 * (a + b) := by sorry
  have h_sum_pos : 0 < a + b := by sorry
  have h_sq_nonneg : 0 ≤ (a - b) ^ 2 := by sorry
  have h_ineq : 0 ≤ a ^ 3 + b ^ 3 - (a ^ 2 * b + a * b ^ 2) := by sorry
  have h_final : a ^ 3 + b ^ 3 ≥ a ^ 2 * b + a * b ^ 2 := by sorry
  --  exact h_final
  linarith