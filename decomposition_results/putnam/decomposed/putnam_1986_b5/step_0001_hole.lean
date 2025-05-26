theorem putnam_1986_b5 (f : MvPolynomial (Fin 3) ℝ) (perms : Set (Set (MvPolynomial (Fin 3) ℝ))) (hf : f = sorry ^ 2 + sorry ^ 2 + sorry ^ 2 + sorry * sorry * sorry) (hperms : perms = {{sorry, sorry, sorry}, {sorry, -sorry, -sorry}, {-sorry, sorry, -sorry}, {-sorry, -sorry, sorry}}) : False ↔
    ∀ (pqr : Fin 3 → MvPolynomial (Fin 3) ℝ),
      (∀ (xyz : Fin 3 → ℝ),
          (MvPolynomial.eval fun i => (MvPolynomial.eval xyz : MvPolynomial (Fin 3) ℝ → ℝ) (pqr i) :
                MvPolynomial (Fin 3) ℝ → ℝ)
              f =
            (MvPolynomial.eval xyz : MvPolynomial (Fin 3) ℝ → ℝ) f) →
        {pqr 0, pqr 1, pqr 2} ∈ perms :=
  by
  have h_main :
    ¬(∀ (pqr : Fin 3 → MvPolynomial (Fin 3) ℝ),
        (∀ (xyz : Fin 3 → ℝ), MvPolynomial.eval (fun i ↦ MvPolynomial.eval xyz (pqr i)) f = MvPolynomial.eval xyz f) →
          ({pqr 0, pqr 1, pqr 2} ∈ perms)) := by sorry
  have h_final :
    (False ↔
      (∀ pqr : Fin 3 → MvPolynomial (Fin 3) ℝ,
        (∀ xyz : Fin 3 → ℝ, MvPolynomial.eval (fun i ↦ MvPolynomial.eval xyz (pqr i)) f = MvPolynomial.eval xyz f) →
          ({pqr 0, pqr 1, pqr 2} ∈ perms))) := by sorry
  --  exact h_final
  hole