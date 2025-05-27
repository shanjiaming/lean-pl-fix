theorem h₁ (n : ℕ) (x : ℝ) : eval (x ^ 2) (16 * (X /ₘ 4) ^ n) = 16 * eval (x ^ 2) ((X /ₘ 4) ^ n) :=
  by simp [eval_mul, eval_pow, eval_add, eval_sub, eval_mul, eval_pow, eval_C, eval_X]