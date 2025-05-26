theorem h_final (f : MvPolynomial (Fin 3) ℝ) (perms : Set (Set (MvPolynomial (Fin 3) ℝ))) (hf : f = sorry ^ 2 + sorry ^ 2 + sorry ^ 2 + sorry * sorry * sorry) (hperms : perms = {{sorry, sorry, sorry}, {sorry, -sorry, -sorry}, {-sorry, sorry, -sorry}, {-sorry, -sorry, sorry}}) (h_main :  ¬∀ (pqr : Fin 3 → MvPolynomial (Fin 3) ℝ),      (∀ (xyz : Fin 3 → ℝ),          (MvPolynomial.eval fun i => (MvPolynomial.eval xyz : MvPolynomial (Fin 3) ℝ → ℝ) (pqr i) :                MvPolynomial (Fin 3) ℝ → ℝ)              f =            (MvPolynomial.eval xyz : MvPolynomial (Fin 3) ℝ → ℝ) f) →        {pqr 0, pqr 1, pqr 2} ∈ perms) : False ↔
    ∀ (pqr : Fin 3 → MvPolynomial (Fin 3) ℝ),
      (∀ (xyz : Fin 3 → ℝ),
          (MvPolynomial.eval fun i => (MvPolynomial.eval xyz : MvPolynomial (Fin 3) ℝ → ℝ) (pqr i) :
                MvPolynomial (Fin 3) ℝ → ℝ)
              f =
            (MvPolynomial.eval xyz : MvPolynomial (Fin 3) ℝ → ℝ) f) →
        {pqr 0, pqr 1, pqr 2} ∈ perms :=
  by
  constructor
  · intro h
    exfalso
    exact h
  · intro h
    exfalso
    exact h_main h