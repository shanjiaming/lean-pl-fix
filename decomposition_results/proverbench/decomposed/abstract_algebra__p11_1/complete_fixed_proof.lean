theorem f_one_eq_zero : Polynomial.IsRoot f 1:=
  by
  have h₁ : Polynomial.eval 1 f = 0:=
    by
    have h₁₁ : f = Polynomial.X ^ 2 + Polynomial.C 1 := rfl
    rw [h₁₁]
    simp [Polynomial.eval_add, Polynomial.eval_pow, Polynomial.eval_X, Polynomial.eval_C] <;> rfl
    hole
  have h₂ : Polynomial.IsRoot f 1:= by
    --  rw [Polynomial.IsRoot]
    exact h₁
    hole
  --  exact h₂
  hole