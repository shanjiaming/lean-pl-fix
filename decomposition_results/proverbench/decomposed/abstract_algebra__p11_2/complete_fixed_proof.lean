theorem f_zero_ne_zero : eval (0 : ZMod 2) f ≠ 0:=
  by
  have h : eval (0 : ZMod 2) f = 1:= by
    --  simp [f, eval_add, eval_pow, eval_X, eval_C, eval_mul, eval_one] <;> norm_num <;> rfl
    hole
  have h₁ : eval (0 : ZMod 2) f ≠ 0:= by -- -- rw [h] <;> decide
    hole
  --  exact h₁
  simpa