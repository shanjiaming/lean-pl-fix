theorem h₅₁₃ (h_main : (MvPolynomial.X 1 - 2 * MvPolynomial.X 0) * (MvPolynomial.X 1 - 2 * MvPolynomial.X 0 - 1) ≠ 0) (a : ℝ) (h₁ :  (MvPolynomial.eval fun n => if n = 0 then (↑⌊a⌋ : ℝ) else (↑⌊2 * a⌋ : ℝ) : MvPolynomial (Fin 2) ℝ → ℝ)      ((MvPolynomial.X 1 - 2 * MvPolynomial.X 0) * (MvPolynomial.X 1 - 2 * MvPolynomial.X 0 - 1)) =    ((↑⌊2 * a⌋ : ℝ) - 2 * (↑⌊a⌋ : ℝ)) * ((↑⌊2 * a⌋ : ℝ) - 2 * (↑⌊a⌋ : ℝ) - 1)) (h₃ : (↑⌊2 * a⌋ : ℝ) - 2 * (↑⌊a⌋ : ℝ) = (↑⌊2 * a⌋ : ℝ) - 2 * (↑⌊a⌋ : ℝ)) (h₅₂ : a - 1 < (↑⌊a⌋ : ℝ)) (h₅₃ : (↑⌊a⌋ : ℝ) ≤ a) (h₅₄ : 2 * a < 2 * (↑⌊a⌋ : ℝ) + 2) (h₅₅ h₅₇ : 2 * (↑⌊a⌋ : ℝ) ≤ 2 * a) (h₅₈ : 2 * a < 2 * (↑⌊a⌋ : ℝ) + 2) (h₅₁₀ : 2 * (↑⌊a⌋ : ℝ) ≤ 2 * a) (h₅₁₁ : 2 * a < 2 * (↑⌊a⌋ : ℝ) + 2) : ⌊2 * a⌋ = 2 * ⌊a⌋ ∨ ⌊2 * a⌋ = 2 * ⌊a⌋ + 1 :=
  by
  have h₅₁₄ : (⌊(2 : ℝ) * a⌋ : ℤ) ≥ 2 * ⌊a⌋ := by sorry
  have h₅₁₇ : (⌊(2 : ℝ) * a⌋ : ℤ) < 2 * ⌊a⌋ + 2 := by sorry
  have h₅₂₀ : (⌊(2 : ℝ) * a⌋ : ℤ) = 2 * ⌊a⌋ ∨ (⌊(2 : ℝ) * a⌋ : ℤ) = 2 * ⌊a⌋ + 1 := by sorry
  --  exact h₅₂₀
  hole