theorem h₂ (a b c : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) (h₁ : a ^ 3 + b ^ 3 + c ^ 3 ≥ a ^ 2 * b + b ^ 2 * c + c ^ 2 * a) : a ^ 3 + b ^ 3 + c ^ 3 ≥ a * b ^ 2 + b * c ^ 2 + c * a ^ 2 := by
  nlinarith [sq_nonneg (a - b), sq_nonneg (b - c), sq_nonneg (c - a), mul_pos ha hb, mul_pos hb hc, mul_pos hc ha,
    sq_nonneg (a + b), sq_nonneg (b + c), sq_nonneg (c + a), mul_pos (sq_pos_of_pos ha) hb,
    mul_pos (sq_pos_of_pos hb) hc, mul_pos (sq_pos_of_pos hc) ha, mul_pos (sq_pos_of_pos ha) hc,
    mul_pos (sq_pos_of_pos hb) ha, mul_pos (sq_pos_of_pos hc) hb]