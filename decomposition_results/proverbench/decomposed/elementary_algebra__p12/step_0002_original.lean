theorem h1  : sorry = 120 := by
  dsimp [f_poly, eval_sub, eval_add, eval_mul, eval_pow, eval_C, eval_X] <;> norm_num <;> ring_nf <;> norm_num <;> rfl