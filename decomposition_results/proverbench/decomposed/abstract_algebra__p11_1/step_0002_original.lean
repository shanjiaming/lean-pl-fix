theorem h₁  : Polynomial.eval 1 sorry = 0 :=
  by
  have h₁₁ : f = Polynomial.X ^ 2 + Polynomial.C 1 := rfl
  rw [h₁₁]
  simp [Polynomial.eval_add, Polynomial.eval_pow, Polynomial.eval_X, Polynomial.eval_C] <;> rfl