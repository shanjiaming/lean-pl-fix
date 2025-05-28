theorem h₄ (h_main : (MvPolynomial.X 1 - 2 * MvPolynomial.X 0) * (MvPolynomial.X 1 - 2 * MvPolynomial.X 0 - 1) ≠ 0) (a : ℝ) (h₁ :  (MvPolynomial.eval fun n => if n = 0 then ↑⌊a⌋ else ↑⌊2 * a⌋)      ((MvPolynomial.X 1 - 2 * MvPolynomial.X 0) * (MvPolynomial.X 1 - 2 * MvPolynomial.X 0 - 1)) =    (↑⌊2 * a⌋ - 2 * ↑⌊a⌋) * (↑⌊2 * a⌋ - 2 * ↑⌊a⌋ - 1)) (h₃ : ↑⌊2 * a⌋ - 2 * ↑⌊a⌋ = ↑⌊2 * a⌋ - 2 * ↑⌊a⌋) : ⌊2 * a⌋ - 2 * ⌊a⌋ = 0 ∨ ⌊2 * a⌋ - 2 * ⌊a⌋ = 1 :=
  by
  have h₅ : (⌊2 * a⌋ : ℤ) = 2 * ⌊a⌋ ∨ (⌊2 * a⌋ : ℤ) = 2 * ⌊a⌋ + 1 := by sorry
  cases h₅ with
  | inl h₅ =>
    have h₆ : (⌊2 * a⌋ - 2 * ⌊a⌋ : ℤ) = 0 := by norm_num [h₅] <;> linarith
    simp_all [h₆] <;> norm_num <;> ring_nf <;>
          simp_all [Int.cast_sub, Int.cast_add, Int.cast_mul, Int.cast_one, Int.cast_zero] <;>
        norm_num <;>
      linarith
  | inr h₅ =>
    have h₆ : (⌊2 * a⌋ - 2 * ⌊a⌋ : ℤ) = 1 := by norm_num [h₅] <;> linarith
    simp_all [h₆] <;> norm_num <;> ring_nf <;>
          simp_all [Int.cast_sub, Int.cast_add, Int.cast_mul, Int.cast_one, Int.cast_zero] <;>
        norm_num <;>
      linarith