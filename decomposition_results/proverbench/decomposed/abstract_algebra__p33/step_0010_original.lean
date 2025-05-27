theorem h₆ (n : ℕ) (x : ℝ) (h₁ : eval (x ^ 2) (16 * (X /ₘ 4) ^ n) = 16 * eval (x ^ 2) ((X /ₘ 4) ^ n)) (h₂ : eval (2 * x) (16 * (X /ₘ 4) ^ n) = 16 * eval (2 * x) ((X /ₘ 4) ^ n)) (h₃ : eval (x ^ 2) ((X /ₘ 4) ^ n) = (x ^ 2 / 4) ^ n) (h₅ : eval (2 * x) ((X /ₘ 4) ^ n) = eval (2 * x) (X /ₘ 4) ^ n) : eval (2 * x) (X /ₘ 4) = 2 * x / 4 := by
  simp [div_eq_mul_inv, eval_mul, eval_pow, eval_add, eval_sub, eval_mul, eval_pow, eval_C, eval_X] <;> ring_nf <;>
      field_simp <;>
    ring