theorem h₂ (P : Polynomial ℤ) (n : ℕ) (hP : ∀ i ∈ Finset.range (n + 1), Polynomial.eval (↑i) P = ↑i % 2) (h₁ : False) : (n % 2 = 0 → Polynomial.eval (↑n + 1) P = 1) ∧ (n % 2 ≠ 0 → Polynomial.eval (↑n + 1) P = 0) :=
  by
  exfalso
  exact h₁