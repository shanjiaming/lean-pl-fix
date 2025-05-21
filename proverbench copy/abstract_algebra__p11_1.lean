lemma f_one_eq_zero : Polynomial.IsRoot f 1 := by
  have h₁ : Polynomial.eval 1 f = 0 := by
    -- Expand the definition of `f` to `X^2 + C 1`
    have h₁₁ : f = Polynomial.X ^ 2 + Polynomial.C 1 := rfl
    rw [h₁₁]
    -- Simplify the evaluation of the polynomial at `1`
    simp [Polynomial.eval_add, Polynomial.eval_pow, Polynomial.eval_X, Polynomial.eval_C]
    -- `simp` will compute the result in `ZMod 2` and use `decide` to verify it is `0`
    <;> rfl
  
  have h₂ : Polynomial.IsRoot f 1 := by
    rw [Polynomial.IsRoot]
    exact h₁
  
  exact h₂