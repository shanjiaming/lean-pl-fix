theorem h_main  : (MvPolynomial.X 1 - 2 * MvPolynomial.X 0) * (MvPolynomial.X 1 - 2 * MvPolynomial.X 0 - 1) ≠ 0 :=
  by
  --  intro h
  have h₁ :
    (MvPolynomial.eval (fun n => (if n = 0 then (1 : ℝ) else 0 : Fin 2 → ℝ))
          ((MvPolynomial.X 1 - 2 * MvPolynomial.X 0) * (MvPolynomial.X 1 - 2 * MvPolynomial.X 0 - 1)) :
        ℝ) =
      (0 : ℝ) := by sorry
  have h₂ :
    (MvPolynomial.eval (fun n => (if n = 0 then (1 : ℝ) else 0 : Fin 2 → ℝ))
          ((MvPolynomial.X 1 - 2 * MvPolynomial.X 0) * (MvPolynomial.X 1 - 2 * MvPolynomial.X 0 - 1)) :
        ℝ) ≠
      (0 : ℝ) := by sorry
  --  contradiction
  hole