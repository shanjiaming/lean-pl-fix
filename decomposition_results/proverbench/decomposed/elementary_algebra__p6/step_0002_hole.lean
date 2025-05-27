theorem h_main (a b : ℝ) (ha : 0 < a) (hb : 0 < b) : a ^ 3 + b ^ 3 - (a ^ 2 * b + a * b ^ 2) = (a - b) ^ 2 * (a + b) := by
  --  ring_nf <;>
          linarith [sq_nonneg (a - b), sq_nonneg (a + b), mul_pos ha hb,
            mul_pos (sq_pos_of_pos ha) (sq_pos_of_pos hb)] <;>
        nlinarith [sq_nonneg (a - b), sq_nonneg (a + b), mul_pos ha hb,
          mul_pos (sq_pos_of_pos ha) (sq_pos_of_pos hb)] <;>
      ring_nf at * <;>
    linarith [sq_nonneg (a - b), sq_nonneg (a + b), mul_pos ha hb, mul_pos (sq_pos_of_pos ha) (sq_pos_of_pos hb)]
  hole