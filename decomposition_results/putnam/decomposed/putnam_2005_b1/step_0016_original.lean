theorem h₅₆ (h_main : (MvPolynomial.X 1 - 2 * MvPolynomial.X 0) * (MvPolynomial.X 1 - 2 * MvPolynomial.X 0 - 1) ≠ 0) (a : ℝ) (h₁ :  (MvPolynomial.eval fun n => if n = 0 then ↑⌊a⌋ else ↑⌊2 * a⌋)      ((MvPolynomial.X 1 - 2 * MvPolynomial.X 0) * (MvPolynomial.X 1 - 2 * MvPolynomial.X 0 - 1)) =    (↑⌊2 * a⌋ - 2 * ↑⌊a⌋) * (↑⌊2 * a⌋ - 2 * ↑⌊a⌋ - 1)) (h₃ : ↑⌊2 * a⌋ - 2 * ↑⌊a⌋ = ↑⌊2 * a⌋ - 2 * ↑⌊a⌋) (h₅₂ : a - 1 < ↑⌊a⌋) (h₅₃ : ↑⌊a⌋ ≤ a) (h₅₄ : 2 * a < 2 * ↑⌊a⌋ + 2) (h₅₅ : 2 * ↑⌊a⌋ ≤ 2 * a) : ⌊2 * a⌋ = 2 * ⌊a⌋ ∨ ⌊2 * a⌋ = 2 * ⌊a⌋ + 1 :=
  by
  have h₅₇ : (2 : ℝ) * (⌊a⌋ : ℝ) ≤ (2 : ℝ) * a := by sorry
  have h₅₈ : (2 : ℝ) * a < (2 : ℝ) * (⌊a⌋ : ℝ) + 2 := by sorry
  have h₅₉ : ⌊(2 : ℝ) * a⌋ = 2 * ⌊a⌋ ∨ ⌊(2 : ℝ) * a⌋ = 2 * ⌊a⌋ + 1 := by sorry
  exact h₅₉