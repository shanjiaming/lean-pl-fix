theorem putnam_2005_b1  : (MvPolynomial.X 1 - 2 * MvPolynomial.X 0) * (MvPolynomial.X 1 - 2 * MvPolynomial.X 0 - 1) ≠ 0 ∧
    ∀ (a : ℝ),
      (MvPolynomial.eval fun n => if n = 0 then (↑⌊a⌋ : ℝ) else (↑⌊2 * a⌋ : ℝ) : MvPolynomial (Fin 2) ℝ → ℝ)
          ((MvPolynomial.X 1 - 2 * MvPolynomial.X 0) * (MvPolynomial.X 1 - 2 * MvPolynomial.X 0 - 1)) =
        0 :=
  by
  have h_main :
    ((MvPolynomial.X 1 - 2 * MvPolynomial.X 0) * (MvPolynomial.X 1 - 2 * MvPolynomial.X 0 - 1) : MvPolynomial (Fin 2) ℝ) ≠
      0 := by sorry
  have h_eval_zero :
    ∀ (a : ℝ),
      MvPolynomial.eval (fun n : Fin 2 => if (n = 0) then (Int.floor a : ℝ) else (Int.floor (2 * a)))
          ((MvPolynomial.X 1 - 2 * MvPolynomial.X 0) * (MvPolynomial.X 1 - 2 * MvPolynomial.X 0 - 1) :
            MvPolynomial (Fin 2) ℝ) =
        0 := by sorry
  exact ⟨h_main, h_eval_zero⟩