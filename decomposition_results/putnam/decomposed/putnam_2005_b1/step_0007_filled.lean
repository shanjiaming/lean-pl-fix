theorem h₂ (h_main : (MvPolynomial.X 1 - 2 * MvPolynomial.X 0) * (MvPolynomial.X 1 - 2 * MvPolynomial.X 0 - 1) ≠ 0) (a : ℝ) (h₁ :  (MvPolynomial.eval fun n => if n = 0 then ↑⌊a⌋ else ↑⌊2 * a⌋)      ((MvPolynomial.X 1 - 2 * MvPolynomial.X 0) * (MvPolynomial.X 1 - 2 * MvPolynomial.X 0 - 1)) =    (↑⌊2 * a⌋ - 2 * ↑⌊a⌋) * (↑⌊2 * a⌋ - 2 * ↑⌊a⌋ - 1)) : (⌊2 * a⌋ - 2 * ⌊a⌋) * (⌊2 * a⌋ - 2 * ⌊a⌋ - 1) = 0 :=
  by
  have h₃ : (⌊2 * a⌋ : ℝ) - 2 * (⌊a⌋ : ℝ) = (⌊2 * a⌋ - 2 * ⌊a⌋ : ℝ) := by sorry
  have h₄ : (⌊2 * a⌋ - 2 * ⌊a⌋ : ℤ) = 0 ∨ (⌊2 * a⌋ - 2 * ⌊a⌋ : ℤ) = 1 := by sorry
  --  cases h₄ with
  --  | inl
  --    h₄ =>
  --    have h₅ : (⌊2 * a⌋ : ℝ) - 2 * (⌊a⌋ : ℝ) = 0 := by
  --      norm_num [h₄] <;> simp_all [Int.cast_sub, Int.cast_add, Int.cast_mul, Int.cast_one, Int.cast_zero] <;>
  --            ring_nf at * <;>
  --          norm_num at * <;>
  --        linarith
  --    rw [h₅] <;> norm_num
  --  | inr
  --    h₄ =>
  --    have h₅ : (⌊2 * a⌋ : ℝ) - 2 * (⌊a⌋ : ℝ) = 1 := by
  --      norm_num [h₄] <;> simp_all [Int.cast_sub, Int.cast_add, Int.cast_mul, Int.cast_one, Int.cast_zero] <;>
  --            ring_nf at * <;>
  --          norm_num at * <;>
  --        linarith
  --    rw [h₅] <;> norm_num <;> ring_nf at * <;> norm_num at * <;> linarith
  hole