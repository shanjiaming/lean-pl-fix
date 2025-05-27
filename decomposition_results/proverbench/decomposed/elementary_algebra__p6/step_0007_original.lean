theorem h_ineq (a b : ℝ) (ha : 0 < a) (hb : 0 < b) (h_main : a ^ 3 + b ^ 3 - (a ^ 2 * b + a * b ^ 2) = (a - b) ^ 2 * (a + b)) (h_sum_pos : 0 < a + b) (h_sq_nonneg : 0 ≤ (a - b) ^ 2) : 0 ≤ a ^ 3 + b ^ 3 - (a ^ 2 * b + a * b ^ 2) :=
  by
  have h₁ : 0 ≤ (a - b) ^ 2 * (a + b) := by sorry
  have h₂ : a ^ 3 + b ^ 3 - (a ^ 2 * b + a * b ^ 2) = (a - b) ^ 2 * (a + b) := h_main
  linarith