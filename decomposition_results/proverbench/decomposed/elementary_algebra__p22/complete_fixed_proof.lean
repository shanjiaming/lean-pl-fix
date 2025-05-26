theorem inequality_for_positive_reals (a b c : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) :
  2 * a ^ 3 + 2 * b ^ 3 + 2 * c ^ 3 + a ^ 2 * b + b ^ 2 * c + c ^ 2 * a ≥
    3 * a * b ^ 2 + 3 * b * c ^ 2 + 3 * c * a ^ 2:=
  by
  have h₁ : a ^ 3 + b ^ 3 + c ^ 3 ≥ a ^ 2 * b + b ^ 2 * c + c ^ 2 * a:= by
    --  nlinarith [sq_nonneg (a - b), sq_nonneg (b - c), sq_nonneg (c - a), mul_pos ha hb, mul_pos hb hc, mul_pos hc ha,
    --    sq_nonneg (a + b), sq_nonneg (b + c), sq_nonneg (c + a), mul_pos (sq_pos_of_pos ha) hb,
    --    mul_pos (sq_pos_of_pos hb) hc, mul_pos (sq_pos_of_pos hc) ha, mul_pos (sq_pos_of_pos ha) hc,
    --    mul_pos (sq_pos_of_pos hb) ha, mul_pos (sq_pos_of_pos hc) hb]
    hole
  have h₂ : a ^ 3 + b ^ 3 + c ^ 3 ≥ a * b ^ 2 + b * c ^ 2 + c * a ^ 2:= by
    --  nlinarith [sq_nonneg (a - b), sq_nonneg (b - c), sq_nonneg (c - a), mul_pos ha hb, mul_pos hb hc, mul_pos hc ha,
    --    sq_nonneg (a + b), sq_nonneg (b + c), sq_nonneg (c + a), mul_pos (sq_pos_of_pos ha) hb,
    --    mul_pos (sq_pos_of_pos hb) hc, mul_pos (sq_pos_of_pos hc) ha, mul_pos (sq_pos_of_pos ha) hc,
    --    mul_pos (sq_pos_of_pos hb) ha, mul_pos (sq_pos_of_pos hc) hb]
    hole
  have h₃ : a ^ 2 * b + b ^ 2 * c + c ^ 2 * a ≥ a * b ^ 2 + b * c ^ 2 + c * a ^ 2:=
    by
    have h₃₁ : 0 < a * b := mul_pos ha hb
    have h₃₂ : 0 < b * c := mul_pos hb hc
    have h₃₃ : 0 < c * a := mul_pos hc ha
    have h₃₄ : 0 < a * b * c:= by -- positivity
      nlinarith
    have h₃₅ : 0 < a * b * c * a:= by -- positivity
      nlinarith
    have h₃₆ : 0 < a * b * c * b:= by -- positivity
      nlinarith
    have h₃₇ : 0 < a * b * c * c:= by -- positivity
      nlinarith
    --  nlinarith [sq_nonneg (a - b), sq_nonneg (b - c), sq_nonneg (c - a), mul_nonneg (sq_nonneg (a - b)) hc.le,
    --    mul_nonneg (sq_nonneg (b - c)) ha.le, mul_nonneg (sq_nonneg (c - a)) hb.le, mul_nonneg (sq_nonneg (a - b)) ha.le,
    --    mul_nonneg (sq_nonneg (b - c)) hb.le, mul_nonneg (sq_nonneg (c - a)) hc.le,
    --    mul_nonneg (sq_nonneg (a + b - 2 * c)) hc.le, mul_nonneg (sq_nonneg (b + c - 2 * a)) ha.le,
    --    mul_nonneg (sq_nonneg (c + a - 2 * b)) hb.le]
    hole
  have h_main :
    2 * a ^ 3 + 2 * b ^ 3 + 2 * c ^ 3 + a ^ 2 * b + b ^ 2 * c + c ^ 2 * a ≥
      3 * a * b ^ 2 + 3 * b * c ^ 2 + 3 * c * a ^ 2 := by sorry
  --  exact h_main
  linarith