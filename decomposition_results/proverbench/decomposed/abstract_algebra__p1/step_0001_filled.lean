theorem no_integer_zeros_for_polynomial_with_pm1_values (P : Polynomial ℤ) (h : ∃ a b c, a ≠ b ∧ b ≠ c ∧ a ≠ c ∧ Polynomial.eval a P = 1 ∧ Polynomial.eval b P = -1 ∧ Polynomial.eval c P = 1) : ¬∃ z, Polynomial.eval z P = 0 :=
  by
  have h_main : ∀ (z : ℤ), P.eval z = 0 → False := by sorry
  have h_final : ¬∃ (z : ℤ), P.eval z = 0 := by sorry
  --  exact h_final
  simpa