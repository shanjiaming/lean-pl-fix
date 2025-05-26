theorem h_eval_zero (h_main : (MvPolynomial.X 1 - 2 * MvPolynomial.X 0) * (MvPolynomial.X 1 - 2 * MvPolynomial.X 0 - 1) ≠ 0) : ∀ (a : ℝ),
    (MvPolynomial.eval fun n => if n = 0 then (↑⌊a⌋ : ℝ) else (↑⌊2 * a⌋ : ℝ) : MvPolynomial (Fin 2) ℝ → ℝ)
        ((MvPolynomial.X 1 - 2 * MvPolynomial.X 0) * (MvPolynomial.X 1 - 2 * MvPolynomial.X 0 - 1)) =
      0 :=
  by
  intro a
  have h₁ :
    MvPolynomial.eval (fun n : Fin 2 => if n = 0 then (Int.floor a : ℝ) else (Int.floor (2 * a)))
        ((MvPolynomial.X 1 - 2 * MvPolynomial.X 0) * (MvPolynomial.X 1 - 2 * MvPolynomial.X 0 - 1) :
          MvPolynomial (Fin 2) ℝ) =
      (↑(Int.floor (2 * a)) - 2 * ↑(Int.floor a)) * (↑(Int.floor (2 * a)) - 2 * ↑(Int.floor a) - 1) := by sorry
  rw [h₁]
  have h₂ : (↑(Int.floor (2 * a)) - 2 * ↑(Int.floor a)) * (↑(Int.floor (2 * a)) - 2 * ↑(Int.floor a) - 1) = 0 := by sorry
  norm_num at * <;> linarith