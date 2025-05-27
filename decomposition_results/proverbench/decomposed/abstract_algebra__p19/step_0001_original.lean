theorem polynomial_decomposition (P : Polynomial ℝ) (hP : ∀ x ≥ 0, Polynomial.eval x P ≥ 0) : ∃ A B, P = A ^ 2 + Polynomial.X * B ^ 2 :=
  by
  have h_false : False := by sorry
  have h_main : ∃ (A B : Polynomial ℝ), P = A ^ 2 + Polynomial.X * B ^ 2 := by sorry
  exact h_main