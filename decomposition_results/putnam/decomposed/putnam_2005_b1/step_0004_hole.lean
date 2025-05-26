theorem h₂ (h : (MvPolynomial.X 1 - 2 * MvPolynomial.X 0) * (MvPolynomial.X 1 - 2 * MvPolynomial.X 0 - 1) = 0) (h₁ : sorry = 0) : sorry ≠ 0 :=
  by
  --  norm_num [MvPolynomial.eval_mul, MvPolynomial.eval_sub, MvPolynomial.eval_add, MvPolynomial.eval_pow,
  --          MvPolynomial.eval_C, MvPolynomial.eval_X] <;>
  --        simp_all [Fin.forall_fin_two] <;>
  --      norm_num <;>
  --    aesop
  hole