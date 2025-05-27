theorem h2 (h1 : eval 7 (f_poly 6) = 120) : eval (eval 7 (f_poly 6)) g_poly = 595 := by
  rw [h1]
  dsimp [g_poly, eval_sub, eval_add, eval_mul, eval_pow, eval_C, eval_X] <;> norm_num <;> ring_nf <;> norm_num <;> rfl