theorem h1 (h0 : 0 ∈ {x | sorry = 0}) : 1 ∉ {x | sorry = 0} := by
  norm_num [f, eval_add, eval_mul, eval_pow, eval_X, eval_C, eval_bit0, eval_bit1, eval_one,
      Set.mem_setOf_eq] at h0 ⊢ <;>
    decide