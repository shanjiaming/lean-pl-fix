theorem h₅ (h_main : (MvPolynomial.X 1 - 2 * MvPolynomial.X 0) * (MvPolynomial.X 1 - 2 * MvPolynomial.X 0 - 1) ≠ 0) (a : ℝ) (h₁ :  (MvPolynomial.eval fun n => if n = 0 then (↑⌊a⌋ : ℝ) else (↑⌊2 * a⌋ : ℝ) : MvPolynomial (Fin 2) ℝ → ℝ)      ((MvPolynomial.X 1 - 2 * MvPolynomial.X 0) * (MvPolynomial.X 1 - 2 * MvPolynomial.X 0 - 1)) =    ((↑⌊2 * a⌋ : ℝ) - 2 * (↑⌊a⌋ : ℝ)) * ((↑⌊2 * a⌋ : ℝ) - 2 * (↑⌊a⌋ : ℝ) - 1)) (h₃ : (↑⌊2 * a⌋ : ℝ) - 2 * (↑⌊a⌋ : ℝ) = (↑⌊2 * a⌋ : ℝ) - 2 * (↑⌊a⌋ : ℝ)) : ⌊2 * a⌋ = 2 * ⌊a⌋ ∨ ⌊2 * a⌋ = 2 * ⌊a⌋ + 1 :=
  by
  have h₅₁ : (⌊2 * a⌋ : ℤ) = 2 * ⌊a⌋ ∨ (⌊2 * a⌋ : ℤ) = 2 * ⌊a⌋ + 1 := by sorry
  --  cases h₅₁ with
  --  | inl h₅₂ => simp_all [Int.cast_add, Int.cast_mul, Int.cast_ofNat] <;> ring_nf at * <;> norm_num at * <;> omega
  --  | inr h₅₂ => simp_all [Int.cast_add, Int.cast_mul, Int.cast_ofNat] <;> ring_nf at * <;> norm_num at * <;> omega
  hole