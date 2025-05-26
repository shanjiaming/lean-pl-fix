theorem h₅₁ (h_main : (MvPolynomial.X 1 - 2 * MvPolynomial.X 0) * (MvPolynomial.X 1 - 2 * MvPolynomial.X 0 - 1) ≠ 0) (a : ℝ) (h₁ :  (MvPolynomial.eval fun n => if n = 0 then (↑⌊a⌋ : ℝ) else (↑⌊2 * a⌋ : ℝ) : MvPolynomial (Fin 2) ℝ → ℝ)      ((MvPolynomial.X 1 - 2 * MvPolynomial.X 0) * (MvPolynomial.X 1 - 2 * MvPolynomial.X 0 - 1)) =    ((↑⌊2 * a⌋ : ℝ) - 2 * (↑⌊a⌋ : ℝ)) * ((↑⌊2 * a⌋ : ℝ) - 2 * (↑⌊a⌋ : ℝ) - 1)) (h₃ : (↑⌊2 * a⌋ : ℝ) - 2 * (↑⌊a⌋ : ℝ) = (↑⌊2 * a⌋ : ℝ) - 2 * (↑⌊a⌋ : ℝ)) : ⌊2 * a⌋ = 2 * ⌊a⌋ ∨ ⌊2 * a⌋ = 2 * ⌊a⌋ + 1 :=
  by
  have h₅₂ : a - 1 < ⌊a⌋ := by sorry
  have h₅₃ : (⌊a⌋ : ℝ) ≤ a := by sorry
  have h₅₄ : (2 : ℝ) * a < (2 : ℝ) * (⌊a⌋ : ℝ) + 2 := by sorry
  have h₅₅ : (2 : ℝ) * (⌊a⌋ : ℝ) ≤ (2 : ℝ) * a := by sorry
  have h₅₆ : ⌊(2 : ℝ) * a⌋ = 2 * ⌊a⌋ ∨ ⌊(2 : ℝ) * a⌋ = 2 * ⌊a⌋ + 1 := by sorry
  --  exact h₅₆
  hole