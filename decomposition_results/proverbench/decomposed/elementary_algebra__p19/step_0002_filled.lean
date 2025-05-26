theorem h₁ (a b c s : ℝ) : a ^ 2 * (s - a) + b ^ 2 * (s - b) + c ^ 2 * (s - c) = s * (a ^ 2 + b ^ 2 + c ^ 2) - (a ^ 3 + b ^ 3 + c ^ 3) :=
  by
  --  ring_nf <;> (try norm_num) <;> (try linarith) <;>
    (try nlinarith [sq_nonneg (a + b + c), sq_nonneg (a - b), sq_nonneg (b - c), sq_nonneg (c - a)])
  hole