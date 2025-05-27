theorem polynomial_parity_evaluation (P : Polynomial ℤ) (n : ℕ) (hP : ∀ i ∈ Finset.range (n + 1), Polynomial.eval (↑i) P = ↑i % 2) : (n % 2 = 0 → Polynomial.eval (↑n + 1) P = 1) ∧ (n % 2 ≠ 0 → Polynomial.eval (↑n + 1) P = 0) :=
  by
  have h₁ : False := by sorry
  have h₂ : (n % 2 = 0 → P.eval ((n + 1) : ℤ) = 1) ∧ (n % 2 ≠ 0 → P.eval ((n + 1) : ℤ) = 0) := by sorry
  exact h₂