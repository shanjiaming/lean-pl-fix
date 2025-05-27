theorem putnam_1986_b5
    (f : MvPolynomial (Fin 3) ℝ)
    (perms : Set (Set (MvPolynomial (Fin 3) ℝ)))
    (hf : f = (X 0) ^ 2 + (X 1) ^ 2 + (X 2) ^ 2 + (X 0) * (X 1) * (X 2))
    (hperms : perms = {{X 0, X 1, X 2}, {X 0, -X 1, -X 2}, {-X 0, X 1, -X 2}, {-X 0, -X 1, X 2}}) :
    ((False) : Prop ) ↔ (∀ pqr : Fin 3 → MvPolynomial (Fin 3) ℝ,
      (∀ xyz : Fin 3 → ℝ, MvPolynomial.eval (fun i ↦ MvPolynomial.eval xyz (pqr i)) f = MvPolynomial.eval xyz f) →
      ({pqr 0, pqr 1, pqr 2} ∈ perms)) :=
  by