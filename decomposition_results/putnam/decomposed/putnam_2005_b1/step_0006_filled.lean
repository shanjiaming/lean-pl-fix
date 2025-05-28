theorem h₁ (h_main : (MvPolynomial.X 1 - 2 * MvPolynomial.X 0) * (MvPolynomial.X 1 - 2 * MvPolynomial.X 0 - 1) ≠ 0) (a : ℝ) : (MvPolynomial.eval fun n => if n = 0 then ↑⌊a⌋ else ↑⌊2 * a⌋)
      ((MvPolynomial.X 1 - 2 * MvPolynomial.X 0) * (MvPolynomial.X 1 - 2 * MvPolynomial.X 0 - 1)) =
    (↑⌊2 * a⌋ - 2 * ↑⌊a⌋) * (↑⌊2 * a⌋ - 2 * ↑⌊a⌋ - 1) :=
  by
  --  simp [MvPolynomial.eval_mul, MvPolynomial.eval_sub, MvPolynomial.eval_add, MvPolynomial.eval_pow, MvPolynomial.eval_C,
  --        MvPolynomial.eval_X] <;>
      (try decide) <;>
    (try
        {simp_all [Fin.forall_fin_two] <;> norm_num <;> ring_nf <;>
            simp [Int.cast_sub, Int.cast_add, Int.cast_mul, Int.cast_one, Int.cast_zero] <;>
          norm_num
      })
  hole