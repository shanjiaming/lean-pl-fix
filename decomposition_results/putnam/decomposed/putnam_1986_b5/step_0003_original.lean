theorem h₂ (f : MvPolynomial (Fin 3) ℝ) (perms : Set (Set (MvPolynomial (Fin 3) ℝ))) (hf : f = sorry ^ 2 + sorry ^ 2 + sorry ^ 2 + sorry * sorry * sorry) (hperms : perms = {{sorry, sorry, sorry}, {sorry, -sorry, -sorry}, {-sorry, sorry, -sorry}, {-sorry, -sorry, sorry}}) (h :  ∀ (pqr : Fin 3 → MvPolynomial (Fin 3) ℝ),    (∀ (xyz : Fin 3 → ℝ),        (MvPolynomial.eval fun i => (MvPolynomial.eval xyz : MvPolynomial (Fin 3) ℝ → ℝ) (pqr i) :              MvPolynomial (Fin 3) ℝ → ℝ)            f =          (MvPolynomial.eval xyz : MvPolynomial (Fin 3) ℝ → ℝ) f) →      {pqr 0, pqr 1, pqr 2} ∈ perms) (h₁ :  (∀ (xyz : Fin 3 → ℝ),      (MvPolynomial.eval fun i => (MvPolynomial.eval xyz : MvPolynomial (Fin 3) ℝ → ℝ) sorry :            MvPolynomial (Fin 3) ℝ → ℝ)          f =        (MvPolynomial.eval xyz : MvPolynomial (Fin 3) ℝ → ℝ) f) →    {sorry, sorry, sorry} ∈ perms) : ∀ (xyz : Fin 3 → ℝ),
    (MvPolynomial.eval fun i => (MvPolynomial.eval xyz : MvPolynomial (Fin 3) ℝ → ℝ) sorry : MvPolynomial (Fin 3) ℝ → ℝ)
        f =
      (MvPolynomial.eval xyz : MvPolynomial (Fin 3) ℝ → ℝ) f :=
  by
  intro xyz
  simp [hf, MvPolynomial.eval_add, MvPolynomial.eval_mul, MvPolynomial.eval_pow, MvPolynomial.eval_X] <;>
                                (try decide) <;>
                              (try ring_nf) <;>
                            (try simp [Fin.forall_fin_succ, Fin.sum_univ_succ, Fin.sum_univ_zero]) <;>
                          (try
                              ring_nf at * <;> simp_all [Fin.forall_fin_succ, Fin.sum_univ_succ, Fin.sum_univ_zero]) <;>
                        (try aesop) <;>
                      (try norm_num) <;>
                    (try ring_nf) <;>
                  (try simp [Fin.forall_fin_succ, Fin.sum_univ_succ, Fin.sum_univ_zero]) <;>
                (try ring_nf at * <;> simp_all [Fin.forall_fin_succ, Fin.sum_univ_succ, Fin.sum_univ_zero]) <;>
              (try aesop) <;>
            (try norm_num) <;>
          simp_all [Fin.forall_fin_succ, Fin.sum_univ_succ, Fin.sum_univ_zero] <;>
        ring_nf at * <;>
      simp_all [Fin.forall_fin_succ, Fin.sum_univ_succ, Fin.sum_univ_zero] <;>
    aesop