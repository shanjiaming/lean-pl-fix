theorem h4 (h0 : 0 ∈ {x | sorry = 0}) (h1 : 1 ∉ {x | sorry = 0}) (h2 : 2 ∉ {x | sorry = 0}) (h3 : 3 ∉ {x | sorry = 0}) : 4 ∈ {x | sorry = 0} := by
  norm_num [f, eval_add, eval_mul, eval_pow, eval_X, eval_C, eval_bit0, eval_bit1, eval_one,
      Set.mem_setOf_eq] at h0 h1 h2 h3 ⊢ <;>
    decide