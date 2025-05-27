theorem h0  : 0 ∈ {x | eval x f = 0} := by
  norm_num [f, eval_add, eval_mul, eval_pow, eval_X, eval_C, eval_bit0, eval_bit1, eval_one] <;> rfl