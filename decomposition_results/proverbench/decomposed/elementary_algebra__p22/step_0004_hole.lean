theorem h₃ (a b c : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) (h₁ : a ^ 3 + b ^ 3 + c ^ 3 ≥ a ^ 2 * b + b ^ 2 * c + c ^ 2 * a) (h₂ : a ^ 3 + b ^ 3 + c ^ 3 ≥ a * b ^ 2 + b * c ^ 2 + c * a ^ 2) : a ^ 2 * b + b ^ 2 * c + c ^ 2 * a ≥ a * b ^ 2 + b * c ^ 2 + c * a ^ 2 :=
  by
  have h₃₁ : 0 < a * b := mul_pos ha hb
  have h₃₂ : 0 < b * c := mul_pos hb hc
  have h₃₃ : 0 < c * a := mul_pos hc ha
  have h₃₄ : 0 < a * b * c := by sorry
  have h₃₅ : 0 < a * b * c * a := by sorry
  have h₃₆ : 0 < a * b * c * b := by sorry
  have h₃₇ : 0 < a * b * c * c := by sorry
  --  nlinarith [sq_nonneg (a - b), sq_nonneg (b - c), sq_nonneg (c - a), mul_nonneg (sq_nonneg (a - b)) hc.le,
  --    mul_nonneg (sq_nonneg (b - c)) ha.le, mul_nonneg (sq_nonneg (c - a)) hb.le, mul_nonneg (sq_nonneg (a - b)) ha.le,
  --    mul_nonneg (sq_nonneg (b - c)) hb.le, mul_nonneg (sq_nonneg (c - a)) hc.le,
  --    mul_nonneg (sq_nonneg (a + b - 2 * c)) hc.le, mul_nonneg (sq_nonneg (b + c - 2 * a)) ha.le,
  --    mul_nonneg (sq_nonneg (c + a - 2 * b)) hb.le]
  hole