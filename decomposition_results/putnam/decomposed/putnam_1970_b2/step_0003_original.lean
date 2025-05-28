theorem h₂ (T : ℝ) (H : Polynomial ℝ) (hT : T > 0) (hH : H.degree ≤ 3) : H =
    Polynomial.C (H.coeff 0) + Polynomial.C (H.coeff 1) * Polynomial.X + Polynomial.C (H.coeff 2) * Polynomial.X ^ 2 +
      Polynomial.C (H.coeff 3) * Polynomial.X ^ 3 :=
  by
  apply Polynomial.funext
  intro x
  simp [Polynomial.eval_add, Polynomial.eval_mul, Polynomial.eval_pow, Polynomial.eval_C, Polynomial.eval_X,
              Polynomial.coeff_add, Polynomial.coeff_mul, Polynomial.coeff_X_pow, Polynomial.coeff_C_mul] <;>
            rw [Polynomial.eval_eq_sum_range] <;>
          simp [Polynomial.coeff_add, Polynomial.coeff_mul, Polynomial.coeff_X_pow, Polynomial.coeff_C_mul,
            Finset.sum_range_succ] <;>
        ring_nf <;>
      norm_num <;>
    linarith [Polynomial.coeff_le_degree (p := H)]